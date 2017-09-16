class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to dash_path
    else
      session[:user_id] = 1
      if ! session[:return_url]
        redirect_to dash_path
      else
        redirect_to session[:return_url]
      end
    end
  end
end
