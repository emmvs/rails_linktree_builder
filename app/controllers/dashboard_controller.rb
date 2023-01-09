# app/controllers/dashboard_controller.rb
class DashboardController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_user, only: [:show]

  def index
    @should_render_navbar = true
  end

  def appearance
    @should_render_navbar = true
  end

  def show
    redirect_to dashboard_path if @user.nil?

    @links = @user.links.where.not(url: '', title: '')
  end

  private

  def set_user
    # Using #find_by_id instead of #find (= nil) in case of text input
    # localhost:3000/1
    # @user = User.find_by_id(params[:id])
    begin
      @user = User.friendly.find(params[:id])
    rescue StandardError
      @user = nil
    end
  end
end
