require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module VoiceWebapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.autoload_paths += Dir["#{config.root}/lib/**/"]

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource(
            '*',
            headers: :any,
            expose: ["Authorization"],
            methods: [:get, :patch, :put, :delete, :post, :options]
          )
      end
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
