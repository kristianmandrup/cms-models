require 'rspec'

require 'active_support/all'
require 'mongoid'

require 'cms-models'

RSpec.configure do |config|
  Mongoid.load!('mongoid.yml', :development)
  Mongoid.logger.level = Logger::WARN
  Mongo::Logger.logger.level = Logger::WARN

  Dotenv.load
  I18n.available_locales = [:en, :es, :fr, :de]
  
  config.tty = true
  config.color = true
  config.formatter = :documentation 
end
