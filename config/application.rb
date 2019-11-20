require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dotenv::Railtie.load




module StockExchange
  class Application < Rails::Application

    Bundler.require(*Rails.groups)

    Dotenv::Railtie.load

    config.SECRET_KEY = ENV['iexcloudSecret']
    config.POSTGRES_PWORD = ENV['postgres']

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
