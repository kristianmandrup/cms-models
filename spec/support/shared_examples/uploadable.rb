class UploadableModel < Cms::Models::Document
  include Uploadable
end

RSpec.shared_examples "Uploadable" do
  it "should upload image" do
    VCR.use_cassette('image_upload', :match_requests_on => [:method, :host]) do
      file = File.new(File.join('spec', 'fixtures', 'ruby.png'), 'r')
      original_storage = Cms::Uploaders::ImageUploader.storage
      begin
        Cms::Uploaders::ImageUploader.storage = :fog
        connection = Fog::Storage.new(Cms::Uploaders::ImageUploader.fog_credentials)
        connection.directories.create(key: Cms::Uploaders::ImageUploader.fog_directory)
        uploadable_model.img_content =  file
        uploadable_model.save!
        url = URI(uploadable_model.img_content.url)
        expect(url.host).to eq('tecla-cms.s3-eu-central-1.amazonaws.com')
      ensure
        Cms::Uploaders::ImageUploader.storage = original_storage
      end
    end
  end
end
