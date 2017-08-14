class VerifyController < ApplicationController
  before_action :require_user
  def new
  end
  def verify
    t = Time.now
    @ip = request.remote_ip
    @user = User.find_by(email: current_user.email)
    if params[:session][:code] == @user.activation_code
      @user.activated = '1'
      @user.activation_code = nil
      if @user.save
          redirect_to dash_path
        end
      else
        redirect_to verify_error_path
      end
  end
def error
end
end
