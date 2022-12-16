# app/controllers/dashboard_controller.rb
class DashboardController < ApplicationController
  before_action :authenticate_user!
  def admin
    @should_render_navbar = true
  end

  def show
    redirect_to dashboard_path if @user.nil?
  end

  private

  def set_user
    # localhost:3000
    @user = User.find_by_id(params[:id])
  end
end
