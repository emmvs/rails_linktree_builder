class DashboardController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_user, only: [:show]

  def index
    @should_render_navbar = true
    @links = current_user.links
    @user = current_user
    @empty_links = current_user.missing_links
  end

  def appearance
    @should_render_navbar = true
    @links = current_user.links
    @user = current_user
    current_user.build_linktree_customization unless current_user.linktree_customization
  end

  def show
    redirect_to dashboard_path if @user.nil?

    @links = @user.links
  end

  private

  def set_user
    @user = User.friendly.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:full_name, :username, :body, :avatar)
  end
end
