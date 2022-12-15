# app/controllers/dashboard_controller.rb
class DashboardController < ApplicationController
  before_action :authenticate_user!
  def admin
    @should_render_navbar = true
  end

  def show

  end

  private

  def set_user

  end
end
