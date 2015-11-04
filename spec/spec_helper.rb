require 'rspec'
require 'active_support/all'
require 'mongoid'
require 'cms-models'
require 'vcr'
require 'webmock'
require 'webmock/rspec'
require 'factory_girl'
require 'faker'
require 'helpers'
RSpec.configure do |config|
  config.include Helpers
  
  Mongoid.load!('mongoid.yml', :development)
  Mongoid.logger.level = Logger::WARN
  Mongo::Logger.logger.level = Logger::WARN

  Dotenv.load
  I18n.available_locales = [:en, :es, :fr, :de]
  
  config.tty = true
  config.color = true
  config.formatter = :documentation 
  
  WebMock.disable_net_connect!(allow_localhost: true)  
  config.include FactoryGirl::Syntax::Methods
  FactoryGirl.definition_file_paths = %w{./spec/factories}
  FactoryGirl.find_definitions
end

VCR.configure do |c|  
  #the directory where your cassettes will be saved
  c.cassette_library_dir = 'spec/vcr'
  # your HTTP request service. 
  c.hook_into :webmock
end  


CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'aws',
      :aws_access_key_id      => ENV['AWS_KEY'],
      :aws_secret_access_key  => ENV['AWS_SECRET'],
      :region                 => ENV['AWS_REGION'] # Change this for different AWS region. Default is 'us-east-1'
  }
  config.fog_directory  = ENV['AWS_BUCKET']
end
  
CarrierWave::Backgrounder.configure do |c|
  c.backend :resque, queue: :carrierwave
end
