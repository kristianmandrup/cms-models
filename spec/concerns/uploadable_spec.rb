require 'spec_helper'

class UploadableModel < Cms::Models::Document
  include Uploadable

end

RSpec.shared_examples "Uploadable" do
  it "should upload image" do
    VCR.use_cassette('image_upload', :match_requests_on => [:method, :host]) do
      file = File.new(File.join('spec', 'fixtures', 'ruby.png'), 'r')
      uploadable_model.img_content =  file
      uploadable_model.save!
      url = URI(uploadable_model.img_content.url)
      expect(url.host).to eq('tecla-cms.s3-eu-central-1.amazonaws.com')
    end
  end
end

RSpec.describe UploadableModel do
  it_behaves_like "Uploadable" do
    let(:uploadable_model) { UploadableModel.create }
  end
end
