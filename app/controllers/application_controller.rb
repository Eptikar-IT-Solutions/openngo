class ApplicationController < ActionController::Base
    include PublicActivity::StoreController
    include Stampable
     
    protect_from_forgery with: :exception

    before_filter :set_locale
    before_action :authenticate_user!

    layout :set_layout

    private

      def set_locale
        if params[:locale] && current_user
          current_user.update({locale: params[:locale]})
        end
        I18n.locale =  (current_user && current_user.locale) || 'en'
      end

      def set_layout
        (request.xhr?) ? false : 'application'
      end
end