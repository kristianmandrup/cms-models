require 'spec_helper'

RSpec.describe ContentItemModel do
  it_behaves_like "ContentItem" do
    let(:name) { Faker::Lorem.characters(10) }
    let(:title) { expected_title_translations['en'] }
    let(:categories) { Faker::Lorem.words(2) }
    let(:tags) { Faker::Lorem.words(2) }
    let(:description) { expected_description_translations['en'] }
    let(:content_item_model) {FactoryGirl.create(:block, name: name, title: title, description: description, categories: categories, tags: tags)}
  end
end
