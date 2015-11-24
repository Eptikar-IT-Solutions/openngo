class ApplicationController < ActionController::Base

      protect_from_forgery with: :exception
      before_filter :set_locale
      before_filter :require_authorization
      layout :set_layout

      def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      end

      def is_admin
        current_user && current_user.id == 1
      end

      def require_authorization
        unless current_user
          flash[:error] = t("controllers.application_controller.You need access right to view this section !")
          redirect_to login_path
        end
      end

      def require_adminstration
        unless is_admin
          flash[:error] = t("controllers.application_controller.You need access right to view this section !")
          redirect_to request.referer
        end
      end

      def set_locale
        I18n.locale = :en
        # Other options for setting locale
        ##
        I18n.locale = params[:locale] || :ar
        # current_user.locale
        # request.subdomain
        # request.env["HTTP_ACCEPT_LANGUAGE"]
        # request.remote_ip
      end

      def set_layout
        (request.xhr?) ? false : 'application'
      end

      helper_method :current_user, :is_admin
  end