class AccountController < ApplicationController
  before_action :require_user
  before_action :check_user
  before_action :check_activated
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
