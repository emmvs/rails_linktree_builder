Rails.application.routes.draw do
  devise_for :users
  get 'dashboard', to: 'dashboard#admin'
  root 'dashboard#admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Gets the id as a parameter to our dashboard_controller within the admin action
  # Allows us to use user_path(user) to get the URL for a user's profile page
  get ':id', to: 'dashboard#show', as: :user
  # Defines the root path route ("/")
  # root "articles#index"
end
