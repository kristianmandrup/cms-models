require 'spec_helper'

RSpec.describe Cms::Models::Image, type: :model do
  let(:image) { VCR.use_cassette('image_upload', :match_requests_on => [:method, :host]) { FactoryGirl.create(:image) } }
  let(:image1) { VCR.use_cassette('image_upload', :match_requests_on => [:method, :host]) { FactoryGirl.create(:image, position: 2) } }
  let(:image2) { VCR.use_cassette('image_upload', :match_requests_on => [:method, :host]) { FactoryGirl.create(:image, position: 3) } }

  it_behaves_like "Documentable" do
    let(:document_model) { image }
  end

  it_behaves_like "ContentItem" do
    let(:name) { Faker::Lorem.characters(10) }
    let(:title) { expected_title_translations['en'] }
    let(:categories) { Faker::Lorem.words(2) }
    let(:tags) { Faker::Lorem.words(2) }
    let(:description) { expected_description_translations['en'] }
    let(:content_item_model) { VCR.use_cassette('image_upload', :match_requests_on => [:method, :host]) { FactoryGirl.create(:image, name: name, title: title, description: description, categories: categories, tags: tags)}}
  end

  it_behaves_like "Listable" do
    let(:listable_model) { image }
    let(:listable_model1) { image1 }
    let(:listable_model2) { image2 }
  end

  it_behaves_like "Templates" do
    let(:template_model) {image }
  end

  it "should have valid image factory" do
    expect(image).to be_valid
  end
end
