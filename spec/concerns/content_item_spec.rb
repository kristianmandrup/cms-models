require 'spec_helper'

require 'concerns/uniquely_named_spec'
require 'concerns/meta_info_spec'
require 'concerns/translatable_spec'
require 'concerns/validatable_spec'
require 'concerns/renderable_spec'
require 'concerns/publishable_spec'
require 'concerns/blueprintable_spec'
require 'concerns/serializable_spec'

RSpec.shared_examples "ContentItem" do
  
  it_behaves_like "UniquelyNamed" do
    let(:uniquely_named_model) { content_item_model }
  end
  
  it_behaves_like "MetaInfo" do
    let(:meta_info_model) { content_item_model }
  end
  
  it_behaves_like "Translatable" do
    let(:translatable_model) { content_item_model }
  end
  
  it_behaves_like "Validatable" do
    let(:validatable_model) { content_item_model }
  end
  
  it_behaves_like "Publishable" do
    let(:publishable_model) { content_item_model }
  end
  
  it_behaves_like "Serializable" do
    let(:serializable_model) { content_item_model }
  end
  
  
end

class ContentItemModel < Cms::Models::Document
  include ContentItem
  
  field :title, type: String
  field :content, type: String
  field :summary, type: String
  
  
  metadata_fields keywords: Array, author: String
  
  fields_validation
  localize_fields :title, :description 
  blueprint!
  
  tracks :name
  
  def blueprint_attributes
    nil
  end
  
  def serializable_attributes
    [:name]
  end
  
  
end

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
class ContentItemModel < Cms::Models::Document
  include ContentItem
  
  field :title, type: String
  field :content, type: String
  field :summary, type: String
  
  metadata_fields keywords: Array, author: String
  
  localize_fields :title, :description 
  
  fields_validation
  
  blueprint!
  
  def blueprint_attributes
    nil
  end
  
  def serializable_attributes
    [:name]
  end
  
  
end

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
