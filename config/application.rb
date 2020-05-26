require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blog
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    # Rails.application.configure do

    config.load_defaults 6.0
    config.api_only = true

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'https://mysterious-refuge-67427.herokuapp.com/'
        resource ('*', 
          headers: :any, 
          methods: [:get, :post, :put, :patch, :delete, :options, :head]
        )
      end
    end
    # config.middleware.delete ActionDispatch::Cookies
    # config.middleware.delete ActionDispatch::Session::CookieStore
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    #
  end
end
