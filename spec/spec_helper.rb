require 'rspec'

require 'active_support/all'
require 'mongoid'

require 'cms-models'

RSpec.configure do |config|
  Mongoid.load!('mongoid.yml', :development)
  Mongoid.logger.level = Logger::WARN
  Mongo::Logger.logger.level = Logger::WARN
  config.tty = true
  config.color = true
end
