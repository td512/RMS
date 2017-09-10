class AccountController < ApplicationController
  before_action :require_user
  before_action :check_user
  before_action :check_activated
  before_action :check_admin, only: [:mkadmin, :mkusr, :deactivate, :impersonate]
  def mkadmin
    u = User.find_by(id: params[:id])
    u.level = "1"
    if u.save
      redirect_to usrmgmt_path
    end
  end
  def mkusr
    u = User.find_by(id: params[:id])
    u.level = "0"
    if u.save
      redirect_to usrmgmt_path
    end
  end
  def deactivate
    u = User.find_by(id: params[:id])
    u.enabled = "0"
    if u.save
      redirect_to usrmgmt_path
    end
  end
  def impersonate
    u = User.find_by(id: params[:id])
  end
  def profile
  end
  def update
  if params[:profile][:first_name].present?
    current_user.first_name = params[:profile][:first_name]
  end
    if params[:profile][:last_name].present?
      current_user.last_name = params[:profile][:last_name]
    end
      if params[:profile][:email].present?
        current_user.email = params[:profile][:email]
      end
        if params[:profile][:password].present?
          current_user.password = params[:profile][:password]
        end
        if current_user.save
          redirect_to account_path
      end
  end
end
