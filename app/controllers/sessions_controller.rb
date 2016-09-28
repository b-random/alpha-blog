class SessionsController < ApplicationController
  def new
  end
  
  def create 
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
    # this validates whether defining 'user' was successful && authenticates it
      flash[:info] = "You have successfully logged in"
      redirect_to user_path(user)
    else   
      flash.now[:danger] = "There was a problem with your login attempt"
      render :new
    end    
  end
  
  def destroy
    session[:user_id] = nil
    # ends user session
    flash[:info] = "You have logged out"
    redirect_to root_path
  end
end