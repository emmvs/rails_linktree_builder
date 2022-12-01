# app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  def admin; end
end
