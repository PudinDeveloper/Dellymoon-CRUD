source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "~> 3.1.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use sqlite3 as the database for Active Record
gem "sqlite3", "~> 1.4"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "bcrypt", "~> 3.1.7"

# Devise is a flexible authentication solution for Rails
gem "devise"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]

  # Faker is a pure-Ruby generator of fake data
  gem 'faker'
end

group :development do
  # solargraph is a language server for Ruby [https://solargraph.org/]
  gem "solargraph"

  # erb_lint is a linter for ERB templates
  gem "erb_lint"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  gem "hotwire-livereload", "~> 1.2"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

# Bootstrap gem for Rails
gem "bootstrap"

# This is the sass gem for Rails to use Bootstrap with better performance
gem 'sass-rails', '~> 6.0.0'

# Byebug is a Ruby debugger for Ruby and will help very easy to debug the code
gem 'byebug'

# activeadmin is a gem for Rails to create admin panel
gem 'activeadmin'

# dockerfile-rails is a gem for Rails to create Dockerfile for Rails application
gem "dockerfile-rails", ">= 1.3", :group => :development

# pg is a gem for Rails to use PostgreSQL database
gem "pg", "~> 1.5"

# redis is a gem for Rails to use Redis database
gem "redis", "~> 5.0"

# cypress-rails is a gem for Rails to use Cypress for testing
gem "cypress-rails"
