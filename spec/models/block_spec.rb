require 'spec_helper'
require 'concerns/document_spec'
require 'concerns/content_item_spec'
require 'concerns/listable_spec'
require 'concerns/extendable_spec'
require 'concerns/images_spec'
require 'concerns/templates_spec'

RSpec.describe Cms::Models::Block, type: :model do
  
  let(:block) {FactoryGirl.create(:block)}
  
  it_behaves_like "Documentable" do
    let(:document_model) {FactoryGirl.create(:block)}
  end
  
  it_behaves_like "ContentItem" do
    let(:categories) { Faker::Lorem.words(2) }
    let(:tags) { Faker::Lorem.words(2) }
    let(:description) { expected_description_translations['en'] }
    let(:content_item_model) {FactoryGirl.create(:block, title: expected_title_translations['en'], description: description, categories: categories, tags: tags)}
  end

  it "should have valid block factory" do
    expect(block).to be_valid
  end

  it "should require a name" do
    block.name = nil
    expect(block).to be_invalid
  end

  it "should require a title" do
    block.title = nil
    expect(block).to be_invalid
  end

  it "should require content" do
    block.content = nil
    expect(block).to be_invalid
  end
  

  # it "should have trackable history and counts" do
  #   user = FactoryGirl.create(:user)
  #   block.update!(title: "test title")
  #   block.update!(title: "new test title")
  #   block.update!(content: "none")
  #   expect(block.title).to eq("new test title")
  #
  #   expect(block.history_tracks.count).to eq(3)
  #   block.undo! user
  #   expect(block.title).to eq("test title")
  # end
  #
  # it "should have orderable" do
  #   block
  #   block1 = FactoryGirl.create(:block)
  #   block2 = FactoryGirl.create(:block)
  #   block2.move_to! 1
  #   expect(block2.position).to eq(1)
  # end
  #
  # it "should return template" do
  #   layout = FactoryGirl.create(:template, :name => "my_layout", :type => "layout", :content => %{
  #     <p>Layout Name: {{ name }} </p>
  #     {{content_for_layout}}
  #   })
  #
  #   block1 = FactoryGirl.create(:block, :title => "block100", content: 'none')
  #   template1 = FactoryGirl.create(:template, :name => "my_template", :templatable => block1, :content => %{
  #     <p> {{ title }} </p>
  #     <p> {{ summary }} </p>
  #     <p> {{ content }} </p>
  #   })
  #
  #   render_template = block1.render(text: 'my_template', layout: 'my_layout')
  #
  # end
end

