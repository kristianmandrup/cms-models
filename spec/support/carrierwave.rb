RSpec.configure do |config|
  Fog.mock!
end

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider              => 'aws',
    :aws_access_key_id     => "AWS_KEY",
    :aws_secret_access_key => "AWS_SECRET",
    :region                => "eu-central-1" # Change this for different AWS region. Default is 'us-east-1'
  }
  config.fog_directory  = "tecla-cms"
  config.storage = :file
end
Cms::Uploaders::ImageUploader.storage = :file

CarrierWave::Backgrounder.configure do |c|
  c.backend :resque, queue: :carrierwave
end
