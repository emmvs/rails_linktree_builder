RailsAdmin.config do |config|
  config.asset_source = :importmap
  config.asset_source = :sprockets

  config.included_models = %w[User Link Click]

  config.parent_controller = '::ApplicationController'

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  # Authentication and authorization
  config.authenticate_with do
    # Use Devise's method to check if the user is logged in
    authenticate_user!

    # Redirect to main page if the user is not an admin (adjust as per your requirements)
    redirect_to main_app.root_path unless current_user.admin?
  end

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
