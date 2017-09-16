class DashboardController < ApplicationController
before_action :require_user
before_action :check_user
before_action :check_admin
before_action :check_activated
def apply
      redirect_to settings_path
end
def new
end
end
