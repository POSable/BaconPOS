class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_username(params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to user_path(user), notice: "Welcome Back #{user.name}!"
      else
        @sign_in_error = "Username / Password combination is invalid"
        render :new
      end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
