class Admin::DashboardController < ApplicationController
before_action :authenticate_admin!

  def index
    @current_nav = "Dashboard"

  end

  private

  def authenticate_admin!
    if !current_user.admin
      redirect_to root_path and return
    end
  end
end
