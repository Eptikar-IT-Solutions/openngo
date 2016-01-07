    class ConfirmationsController < Devise::ConfirmationsController

      def show
        if params[:confirmation_token].present?
          @original_token = params[:confirmation_token]
        elsif params[resource_name].try(:[], :confirmation_token).present?
          @original_token = params[resource_name][:confirmation_token]
        end
        self.resource = resource_class.confirm_by_token(params[:confirmation_token])

        if resource.errors.empty?
          set_flash_message(:notice, :confirmed) if is_navigational_format?
          sign_in(resource_name, resource)
          #respond_with_navigational(resource){ redirect_to confirmation_getting_started_path }
        else
          respond_with_navigational(resource.errors, :status => :unprocessable_entity){ render :new }
        end
      end

      def confirm
        @original_token = params[resource_name].try(:[], :confirmation_token)
        self.resource = resource_class.find_by_confirmation_token! @original_token
        resource.assign_attributes(permitted_params) unless params[resource_name].nil?
        resource.save
        if resource.valid? && resource.password_match?
          self.resource.confirm
          set_flash_message :notice, :confirmed
          sign_in_and_redirect resource_name, resource
        else
          render :action => 'show'
        end
      end

     private
       def permitted_params
         params.require(resource_name).permit(:name, :full_name, :email, :confirmation_token, :password, :password_confirmation)
       end
    end