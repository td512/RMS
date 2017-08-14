class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :init

def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end
def require_user
  redirect_to '/login' unless current_user
end
def init
  @start_time = Time.now
end
def gravatar_url(email, size)
gravatar = Digest::MD5::hexdigest(email).downcase
url = "http://gravatar.com/avatar/#{gravatar}.png?s=#{size}"
end
helper_method :gravatar_url
def check_user
  redirect_to verify_path unless current_user && current_user.activated == '1'
end
def check_admin
  redirect_to root_path unless current_user && current_user.level == '1'
end
def check_activated
  redirect_to logout_path unless current_user && current_user.enabled == '1'
end
helper_method :check_admin
helper_method :check_user
helper_method :check_activated
before_action :set_cache_headers

  private

  def set_cache_headers
    response.headers["Cache-Control"] = "no-cache, no-store"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
end
