class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def emlerr
    @user = User.new
  end

def create
  @user = User.new(user_params)
  if User.exists?(:email => @user.email)
    redirect_to '/signup/error/email'
  else
    if EmailValidator.valid?(@user.email)
      if User.first.nil?
        act_code = SecureRandom.hex(6)
        token = SecureRandom.hex(48)
        @user.activation_code = act_code
        @user.activated = '0'
        @user.level = '1'
        @user.enabled = '1'
        if @user.save
          PostmarkMailer.verify(@user).deliver_now
          session[:user_id] = @user.id
          redirect_to dash_path
        else
          redirect_to '/signup/error/email'
        end
      else
        act_code = SecureRandom.hex(6)
        token = SecureRandom.hex(48)
        @user.activation_code = act_code
        @user.activated = '0'
        @user.level = '0'
        @user.enabled = '1'
        if @user.save
          PostmarkMailer.verify(@user).deliver_now
          session[:user_id] = @user.id
          redirect_to dash_path
        else
          redirect_to '/signup/error/email'
        end
      end
  end
end
end
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
