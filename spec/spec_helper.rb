ENV['TRANSLATOR_CLIENT_SECRET'] ||= ''
ENV['TRANSLATOR_CLIENT_ID'] ||= ''

require 'rspec'
require 'active_support/all'
require 'byebug'
require 'mongoid'
require 'cms-models'
require 'factory_girl'
require 'faker'
require 'helpers'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.include Helpers

  Mongoid.load!('mongoid.yml', :development)
  Mongoid.logger.level = Logger::WARN
  Mongo::Logger.logger.level = Logger::WARN
  Mongoid::History.modifier_class_name = 'Cms::Models::DummyUser'

  Dotenv.load
  I18n.available_locales = [:en, :es, :fr, :de]

  config.tty = true
  config.color = true
  config.formatter = :documentation
end
