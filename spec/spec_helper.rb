require 'rspec'

require 'active_support/all'
require 'mongoid'

require 'cms/models'

RSpec.configure do |config|
  Mongoid.load!("mongoid.yml", :development)
  
end
