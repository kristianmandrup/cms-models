require 'spec_helper'

RSpec.describe Cms::Models::Image, type: :model do
  let(:file) { File.new(File.join('spec', 'fixtures', 'ruby.png'), 'r') }
  let(:image) {FactoryGirl.build(:image)}
  
  it "should have valid image factory" do
    image.img_content = file
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
