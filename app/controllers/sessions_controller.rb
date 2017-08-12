class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to dash_path
    end
  end
  def create
  t = Time.now
  if @user && @user.authenticate(params[:session][:password])
    if @user.enabled == "0"
      redirect_to logout_path
    else
    session[:user_id] = @user.id
    redirect_to dash_path
    end
  else
    redirect_to '/login/error'
  end
end
def destroy
  session[:user_id] = nil
  redirect_to '/login/session'
end
def error
  if current_user
    redirect_to dash_path
  end
end
def newpass
end
def loggedout
  if current_user
    redirect_to dash_path
  end
end
end
