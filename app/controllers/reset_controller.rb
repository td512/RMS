class ResetController < ApplicationController
  def check
    if User.find_by(email: params[:session][:email])
    @user = User.find_by(email: params[:session][:email])
    if params[:session][:email] == @user.email
      @user.reset = SecureRandom.hex(6)
      if @user.save
          PostmarkMailer.reset(@user).deliver_now
          redirect_to reset_done_path
        end
      else
        redirect_to reset_error_path
      end
    else
      redirect_to reset_error_path
    end
  end
  def done
  end
  def reset
  end
  def change
    if User.find_by(reset: params[:id])
      @user = User.find_by(reset: params[:id])
      if params[:id] == @user.reset
        @user.password = params[:session][:password]
        @user.reset = nil
        if @user.save
          session[:user_id] = @user.id
          redirect_to dash_path
      else
        redirect_to reset_error_reset_path
        end
      else
      redirect_to reset_error_reset_path
    end
  else
    redirect_to reset_error_reset_path
  end
  end
  def error
  end
  def chgerror
  end
end
