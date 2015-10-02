require 'spec_helper'

class ImagesModel < Cms::Models::Document
  include Images
  field :name, type: String
  
end

describe Images do
  let(:file) { File.new(File.join('spec', 'fixtures', 'ruby.png'), 'r') }
  let(:image_model) {ImagesModel.create name: Faker::Name.name }

  it "should be valid image model" do
    expect(image_model).to be_valid
  end
  
  it "should have images" do
    VCR.use_cassette('image_upload', :match_requests_on => [:method, :host]) do
      image = FactoryGirl.create(:image, img_content: file)
      image_model.images << image
      expect(image_model.images.count).to eq(1)
    end
  end
end
