# app/controllers/links_controller.rb
class LinksController < ApplicationController
  before_action :authenticate_user!, only: [:update]
  before_action :link_params, only: [:update]

  def update
    @link = Link.find(params[:id])
    @link.update(link_params)
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
