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

  #it "should require a title" do
    #image.title = nil
    #expect(image).to be_invalid
  #end

  #it "should have trackable history and counts" do
    #user = FactoryGirl.create(:user)
    #image.update(title: "test title", modifier: user)
    #image.update(title: "new test title")
    #expect(image.title).to eq("new test title")
    #expect(image.history_tracks.count).to eq(2)
    #image.undo! user
    #expect(image.title).to eq("test title")
  #end

  #it "should have orderable" do
    #image
    #image1 = FactoryGirl.create(:image)
    #image2 = FactoryGirl.create(:image)
    #image2.move_to! 1
    #expect(image2.position).to eq(1)
  #end

  #it "should have upload image" do
    #image.content = fixture_file_upload(Rails.root.join('spec', 'photos', 'icon.png'), 'image/png')
    #expect(image.content.url.present?).to eq(true)
  #end
end
