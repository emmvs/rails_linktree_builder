# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby '3.1.2'

# Rails
gem 'rails', '~> 7.0.4'
gem 'sprockets-rails' # Asset pipeline

# Server
gem 'puma', '~> 5.0'

# Database
gem 'pg' # Postgres

# Frontend
gem 'autoprefixer-rails'
gem 'bootstrap', '~> 5.2'
gem 'font-awesome-sass', '~> 6.1'
gem 'importmap-rails' # JavaScript with ESM import maps
gem 'sassc-rails'
gem 'simple_form'
gem 'stimulus-rails' # Hotwire's modest JavaScript framework
gem 'turbo-rails' # Hotwire's SPA-like page accelerator

# Utilities
gem 'browser' # Browser detection library
gem 'cloudinary' # Image hosting
gem 'dotenv-rails', groups: %i[development test] # Environment variables
gem 'friendly_id', '~> 5.5' # Slugs for models
gem 'geocoder' # Geocoding library
gem 'image_processing', '~> 1.2' # Active Storage variants
gem 'rails_admin', '~> 3.0' # Admin feature
gem 'redis', '~> 4.0' # Redis adapter for Action Cable

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Authentication
gem 'devise', '~> 4.8'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw] # Debugging
  gem 'factory_bot_rails' # Test data
  gem 'faker' # Fake data generation
end

group :development do
  gem 'database_cleaner' # Database cleaning for tests
  gem 'rspec-rails' # Testing framework
  gem 'web-console' # Console on exception pages
end

group :test do
  gem 'capybara' # Integration testing
  gem 'selenium-webdriver' # Browser automation
  gem 'webdrivers' # Web drivers for browsers
end

# Platform-specific gems
gem 'ruby-vips', '~> 2.2.0' # Image processing library
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby] # Timezone data

# Uncomment to use:
# gem "kredis" # Higher-level data types in Redis
# gem "bcrypt", "~> 3.1.7" # Secure password for Active Model
# gem "rack-mini-profiler" # Performance profiling (development)
# gem "spring" # Speed up commands (development)
