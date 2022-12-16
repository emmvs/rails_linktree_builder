# app/controllers/dashboard_controller.rb
class DashboardController < ApplicationController
  before_action :authenticate_user!, except: 
  before_action :set_user, only: [:show]

  def admin
    @should_render_navbar = true
  end

  def show
    redirect_to dashboard_path if @user.nil?
  end

  private

  def set_user
    # Using find_by_id instead of find in case of text input
    @user = User.find_by_id(params[:id])
  end
end
