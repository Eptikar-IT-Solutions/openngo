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
          current_user.update({ language: params[:locale] })
        end
        I18n.locale =  (current_user && current_user.language) || 'en'
      end

      def other_locale
        ([:en, :ar] - Array(I18n.locale)).first
      end

      def set_layout
        (request.xhr?) ? false : 'application'
      end

      helper_method :other_locale
end