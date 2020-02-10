# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# if ['development', 'test'].include? ENV['RAILS_ENV']
#   Dotenv::Railtie.load
# end

module TestGuru
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.autoload_paths += %W[
      #{config.root}/lib/clients
    ]

    config.time_zone = 'Moscow'

    config.i18n.default_locale = :ru

    config.generators do |g|
      g.orm             :active_record
      g.template_engine :slim
      # g.test_framework  :test_unit, fixture: true
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
