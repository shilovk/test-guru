# frozen_string_literal: true

if ['development', 'test'].include? ENV['RAILS_ENV']
  Dotenv.require_keys('GIST_ACCESS_TOKEN')
end
