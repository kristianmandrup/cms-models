require 'spec_helper'

class UploadableModel < Cms::Models::Document
  include Uploadable

end

describe Uploadable do
  it "should upload image" do
    VCR.use_cassette('image_upload', :match_requests_on => [:method, :host]) do
      file = File.new(File.join('spec', 'fixtures', 'ruby.png'), 'r')
      uploadable_model = UploadableModel.create img_content: file
      url = URI(uploadable_model.img_content.url)
      expect(url.host).to eq('tecla-cms.s3-eu-central-1.amazonaws.com')
    end
  end
end
