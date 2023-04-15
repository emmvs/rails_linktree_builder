# app/controllers/dashboard_controller.rb
class DashboardController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_user, only: [:show]

  def index
    @should_render_navbar = true
    @links = current_user.links
    @empty_links = current_user.missing_links
  end

  def appearance
    @should_render_navbar = true
  end

  def show
    redirect_to dashboard_path if @user.nil?

    @links = @user.links
  end

  private

  def set_user
    @user = User.friendly.find(params[:id])
  end
end
