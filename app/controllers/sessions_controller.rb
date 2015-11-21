class SessionsController < ApplicationController

  skip_before_filter :require_authorization, :only => [:new, :create]

    def new
      render :layout => false
    end

    def create
      user = User.find_by_name(params[:name])
      if user && user.authenticate(params[:password]) && user.active
        session[:user_id] = user.id
        session[:name] = user.name
        session[:email] = user.email
        redirect_to root_url , :success => t("controllers.sessions.Logged in Successfully")
      else
        flash.now.alert = t("controllers.sessions.Failed to log in!")
        render "new", :layout => false
      end
    end

    def destroy
      session[:user_id] = nil
      session[:name] = nil
      session[:email] = nil
      redirect_to root_url, :notice => t("controllers.sessions.Logged out Successfully")
    end
  end