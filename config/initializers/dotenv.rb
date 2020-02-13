# frozen_string_literal: true

Dotenv.require_keys('GIST_ACCESS_TOKEN') if %i[development test].include? ENV['RAILS_ENV']
