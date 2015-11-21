require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Openngo
  class Application < Rails::Application

    config.assets.paths << "#{Rails.root}/app/assets/fonts"
    
    config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.test_framework :rspec
    end

  end
end
