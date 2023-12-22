class LinksController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update]
  before_action :set_link, only: [:update, :track_click]

  def create
    @link = Link.new(link_params)
    @link.user = current_user
    if @link.save
      redirect_to dashboard_path, notice: "Link was successfully created. 🎉"
    else
      render :new, alert: "Error creating link. 😱"
    end
  end

  def update
    if @link.update(link_params)
      redirect_to dashboard_path, notice: "Link was successfully updated. 🎉"
    else
      render :edit, alert: "Error updating link. 😱"
    end
  end

  def track_click
    @link.increment!(:click_count)
    @link.update!(last_clicked_at: Time.current)
    @link.user_agent = request.user_agent
    browser = Browser.new(request.user_agent)
    @link.device_type = browser.device.name

    results = Geocoder.search(request.remote_ip)
    if results.present?
      @link.country = results.first.country
      @link.city = results.first.city
    end

    @link.save
    redirect_to @link.url, allow_other_host: true
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end

  def set_link
    @link = Link.find(params[:id])
  end
end
