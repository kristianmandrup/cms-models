require 'spec_helper'
require 'concerns/named_spec'
RSpec.describe Cms::Models::Named::Image, type: :model do

  it_behaves_like "Named" do
    let(:name) { Faker::Lorem.characters(10) }
    let(:named_model) { FactoryGirl.create(:named_image, name: name) }
  end
  
  it "should have one image" do 
    name_image = FactoryGirl.create(:named_image)
    params = FactoryGirl.attributes_for(:image)
    name_image.build_image(params)
    name_image.save!
    expect(name_image.image.name).to eq(params[:name])
  end
end
