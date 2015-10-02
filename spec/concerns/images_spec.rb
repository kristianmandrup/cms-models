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
    #image_model.images << FactoryGirl.create(:image)
  end
end
