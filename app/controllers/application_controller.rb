# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_should_render_navbar
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:full_name, :username, :body, :avatar,
                                             { linktree_customization_attributes: %i[id theme background_color link_shape link_color link_font_color] }])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: [:full_name, :username, :body, :avatar,
                                             { linktree_customization_attributes: %i[id theme background_color link_shape link_color link_font_color] }])
  end

  def set_should_render_navbar
    @should_render_navbar = false
  end
end
