class AccountController < ApplicationController
  before_action :require_user
  before_action :check_user
  before_action :check_activated
  def profile
  end
  def update
  end
end
