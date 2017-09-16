class AccountController < ApplicationController
  before_action :require_user
  before_action :check_user
  before_action :check_activated
  before_action :check_admin, only: [:mkadmin, :mkusr, :deactivate, :impersonate]
  def impersonate
    u = User.find_by(id: params[:id])
    session[:impersonate] = current_user.id
    session[:user_id] = u.id
    redirect_to root_path
  end
  def stop_impersonate
    u = User.find_by(id: params[:id])
    session[:impersonate] = nil
    session[:user_id] = u.id
    redirect_to root_path
  end
  def profile
  end
  def update
          redirect_to account_path
  end
end
