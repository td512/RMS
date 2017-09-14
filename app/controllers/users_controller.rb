class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def emlerr
    @user = User.new
  end
  def usrerr
    @user = User.new
  end
def create
  @user = User.new(user_params)
  if User.exists?(:email => @user.email)
    redirect_to emlerr_path
  else
    if verify_recaptcha(model: @user)
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
          redirect_to emlerr_path
        end
      else
        profanity_filter = LanguageFilter::Filter.new(matchlist: :profanity, creative_letters: true)
        hate_filter = LanguageFilter::Filter.new(matchlist: :hate, creative_letters: true)
        sex_filter = LanguageFilter::Filter.new(matchlist: :sex, creative_letters: true)
        violence_filter = LanguageFilter::Filter.new(matchlist: :violence, creative_letters: true)
        if profanity_filter.match?(@user.first_name+" "+@user.last_name) || hate_filter.match?(@user.first_name+" "+@user.last_name) || sex_filter.match?(@user.first_name+" "+@user.last_name) || violence_filter.match?(@user.first_name+" "+@user.last_name)
          redirect_to usrerr_path
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
            redirect_to emlerr_path
          end
        end
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
