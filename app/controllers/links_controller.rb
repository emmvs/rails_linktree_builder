class LinksController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update]
  before_action :set_link, only: [:update, :track_click]

  def create
    @link = Link.new(link_params)
    @link.user = current_user
    if @link.save
      redirect_to dashboards_path, notice: "Link was successfully created. 🎉"
    else
      render :new, alert: "Error creating link. 😱"
    end
  end

  def update
    if @link.update(link_params)
      redirect_to dashboards_path, notice: "Link was successfully updated. 🎉"
    else
      render :edit, alert: "Error updating link. 😱"
    end
  end

  def track_click
    @link.increment!(:click_count)
    # @link.update!(last_clicked_at: Time.current)
    @link.last_clicked_at = Time.current

    begin
      create_click_record(request.remote_ip)
    rescue => e
      Rails.logger.error "Error in track_click: #{e.message}"
      redirect_to error_path, alert: "Ooops! An error occurred. 😱" and return
    end

    if @link.save
      redirect_to @link.url, allow_other_host: true
    else
      redirect_to error_path, alert: "Error processing your request."
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end

  def set_link
    @link = Link.find(params[:id])
  end

  def create_click_record(remote_ip)
    @link.clicks.create(
      user_agent: request.user_agent,
      device_type: determine_device_type(request.user_agent),
      country: determine_country(remote_ip),
      city: determine_city(remote_ip),
      clicked_at: Time.current
    )
  end

  def determine_country(remote_ip)
    results = Geocoder.search(remote_ip)
    if results.present? && !results.first.data["bogon"]
      results.first.country
    else
      "Local"
    end
  end

  def determine_city(remote_ip)
    results = Geocoder.search(remote_ip)
    if results.present? && !results.first.data["bogon"]
      results.first.city
    else
      "Local"
    end
  end

  def determine_device_type(user_agent)
    browser = Browser.new(user_agent)
    if browser.device.mobile?
      "Mobile"
    elsif browser.device.tablet?
      "Tablet"
    elsif browser.device.tv?
      "TV"
    elsif browser.known?
      "Desktop"
    else
      "Unknown"
    end
  end
end
