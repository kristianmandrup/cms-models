require 'spec_helper'
require 'concerns/uniquely_named_spec'
RSpec.describe Cms::Models::Image::List, type: :model do

  let(:image_list) {FactoryGirl.create(:image_list)}
  let(:image1) { VCR.use_cassette('image_upload', :match_requests_on => [:method, :host]) { FactoryGirl.create(:image) } }
  let(:image2) { VCR.use_cassette('image_upload', :match_requests_on => [:method, :host]) { FactoryGirl.create(:image) } }
  
  def field_names
    Cms::Models::Image::List.fields.keys
  end
  
  def test_image_list(response, image_list)
    expect(response['type']).to eq(image_list.type)
    expect(response['name']).to eq(image_list.name)
    
    image_list.images.each_with_index do |image, index|
      test_image(response['images'][index], image)
    end
    
    image_list.image_lists.each do |list|
      test_image_list(response[list.name], list)
    end
  end
  
  def test_image(response, image)
    expect(response['name']).to eq(image.name)
    expect(response['title']).to eq(image.title)
    expect(response['content']).to eq(image.content)
  end
  
  it_behaves_like "UniquelyNamed" do
    let(:name) { Faker::Lorem.characters(10) }
    let(:uniquely_named_model) { FactoryGirl.create(:image_list, name: name) }
  end
  
  it 'should have valid image list factory' do
    expect(image_list).to be_valid
  end
  
  it 'should have many images' do
    image_list1 = FactoryGirl.create(:image_list)
    
    image_list1.image_lists.create(FactoryGirl.attributes_for(:image_list))
    expect(image_list1.image_lists.count).to eq(1)
    
    VCR.use_cassette('image_upload', :match_requests_on => [:method, :host]) do 
      image_list1.images.create(FactoryGirl.attributes_for(:image))
    end
    
    expect(image_list1.images.count).to eq(1)
  end
  
  it "should be hashable" do
    image_list1 = FactoryGirl.create(:image_list)
    image_list2 = FactoryGirl.create(:image_list)
    
    
    image_list1.add_list(image_list2)
    image_list1.add_image(image1)
    image_list2.add_image(image2)
    response = image_list1.set_hash
   
    test_image_list(response, image_list1)
  end
end
