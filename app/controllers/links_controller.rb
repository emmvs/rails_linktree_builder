# app/controllers/links_controller.rb
class LinksController < ApplicationController
  before_action :authenticate_user!, only: [:update]

  def create
    @link = Link.new(link_params)
    @link.user = current_user
    @link.save
    redirect_to dashboard_path
  end

  def update
    @link = Link.find(params[:id])
    @link.update(link_params)
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
