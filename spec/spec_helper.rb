require 'rspec'

require 'active_support/all'
require 'mongoid'

require 'cms-models'
require 'webmock/rspec'

RSpec.configure do |config|
  Mongoid.load!('mongoid.yml', :development)
  Mongoid.logger.level = Logger::WARN
  Mongo::Logger.logger.level = Logger::WARN

  Dotenv.load
  I18n.available_locales = [:en, :es, :fr, :de]
  
  config.tty = true
  config.color = true
  config.formatter = :documentation 
  
  WebMock.disable_net_connect!(allow_localhost: true)  
  
  config.extend VCR::RSpec::Macros
end

VCR.configure do |c|  
  #the directory where your cassettes will be saved
  c.cassette_library_dir = 'spec/vcr'
  # your HTTP request service. 
  c.hook_into :webmock
end  
