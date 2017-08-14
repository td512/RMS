class DashboardController < ApplicationController
before_action :require_user
before_action :check_user
before_action :check_admin
before_action :check_activated
def new
end
end
