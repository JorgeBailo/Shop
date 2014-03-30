class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_name] = user.name + " " + user.lastname
      redirect_to root_url
    else
      flash[:error] = "Invalid email or password"
      redirect_to login_url   
    end
  end

  def destroy
    session[:user_id] = nil
    session[:user_name] = nil
    redirect_to login_url, notice: "Logged out"
  end

end
