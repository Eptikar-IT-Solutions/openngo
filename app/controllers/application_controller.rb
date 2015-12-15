class ApplicationController < ActionController::Base
    include PublicActivity::StoreController

    protect_from_forgery with: :exception
    before_filter :set_locale
    before_action :authenticate_user!
    #before_filter :require_authorization
    before_action :authenticate_user!
    layout :set_layout

    # def current_user
    #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # end

    # def is_admin
    #   current_user && current_user.id == 1
    # end

    # def require_authorization
    #   unless current_user
    #     flash[:error] = t("controllers.application_controller.You need access right to view this section !")
    #     redirect_to login_path
    #   end
    # end

    # def require_adminstration
    #   unless is_admin
    #     flash[:error] = t("controllers.application_controller.You need access right to view this section !")
    #     redirect_to request.referer
    #   end
    # end

    def set_locale
      if params[:locale] && current_user
        current_user.update({locale: params[:locale]})
      end
        I18n.locale =  (current_user && current_user.locale) || I18n.default_locale
    end

    def set_layout
      (request.xhr?) ? false : 'application'
    end

    #helper_method :current_user, :is_admin
end