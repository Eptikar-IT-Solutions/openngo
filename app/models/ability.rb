class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    if user.is_admin?
      can :manage, :all
      can :assign_roles, User  
      #can [:create,:show, :write, :edit, :update] , User
    else
      # Need to eager load all models (development only, already ON in production)
      Rails.application.eager_load!
      # Bootstraping permissions
      ActiveRecord::Base.descendants.each { |model| cannot [:manage, :read, :write, :delete], model }
        user.role.permissions.except(:all).each do |controller,controller_permissions|
          if controller_permissions.fetch(:manage, false).to_s == "true"
            can [:manage, :read, :write, :delete], controller.to_s.singularize.capitalize.constantize
          else
            controller_permissions.each do |action, access_right|
              case access_right.to_s
              when "true" then
                can action.to_sym, controller.to_s.singularize.capitalize.constantize
              when "false" then
                cannot action.to_sym, controller.to_s.singularize.capitalize.constantize
              end
            end
          end
        end

      # Rule[0]: User can manage his own resource
      ActiveRecord::Base.descendants.each do |model|
        can :delete, model do |model|
          model.try(:created_by) == user.id
        end
      end

      #making sure cannot manage user permissions
      cannot :assign_roles, User
      cannot :read, User
    end

    # Global Access Right Rules
    # ------- Be Careful !! ------
    # Any rule you put here will override all prevouisly defined rules and 
    # will apply to all users, including super user

    # Rule[1]: every authenticated user has the right to read some basic stuff
    can :read, [Project, Activity]

    # Rule[2]: user can edit his own profile
    can [:show, :write, :edit, :update] , User, id: user.id

    # Rule[3]: user deletion is locked in general
    cannot :destroy, User

    # Rule[4]: user cannot touch organizations in general
    #cannot [:read, :write, :edit, :update] , Organization
  end
end
