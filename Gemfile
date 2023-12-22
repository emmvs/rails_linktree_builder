source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby "3.1.2"

# Rails
gem "rails", "~> 7.0.4"
gem "sprockets-rails" # Asset pipeline

# Server
gem "puma", "~> 5.0"

# Database
gem "pg" # Postgres

# Frontend
gem "importmap-rails" # JavaScript with ESM import maps
gem "turbo-rails" # Hotwire's SPA-like page accelerator
gem "stimulus-rails" # Hotwire's modest JavaScript framework
gem "bootstrap", "~> 5.2"
gem "simple_form"
gem "font-awesome-sass", "~> 6.1"
gem "autoprefixer-rails"
gem "sassc-rails" # Use Sass for CSS

# Utilities
gem "image_processing", "~> 1.2" # Active Storage variants
gem "redis", "~> 4.0" # Redis adapter for Action Cable
gem "dotenv-rails", groups: [:development, :test] # Environment variables
gem "friendly_id", "~> 5.5" # Slugs for models
gem "geocoder" # Geocoding library
gem "browser" # Browser detection library
gem "rails_admin", "~> 3.0" # Admin feature
gem "cloudinary" # Image hosting

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Authentication
gem "devise", "~> 4.8"

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw] # Debugging
  gem "factory_bot_rails" # Test data
  gem "faker" # Fake data generation
end

group :development do
  gem "web-console" # Console on exception pages
  gem "database_cleaner" # Database cleaning for tests
  gem "rspec-rails" # Testing framework
end

group :test do
  gem "capybara" # Integration testing
  gem "selenium-webdriver" # Browser automation
  gem "webdrivers" # Web drivers for browsers
end

# Platform-specific gems
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby] # Timezone data
gem "ruby-vips", "~> 2.2.0" # Image processing library

# Uncomment to use:
# gem "kredis" # Higher-level data types in Redis
# gem "bcrypt", "~> 3.1.7" # Secure password for Active Model
# gem "rack-mini-profiler" # Performance profiling (development)
# gem "spring" # Speed up commands (development)
