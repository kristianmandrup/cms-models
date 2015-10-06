require 'spec_helper'

require 'concerns/uniquely_named_spec'
require 'concerns/meta_info_spec'
require 'concerns/translatable_spec'
require 'concerns/validatable_spec'
require 'concerns/renderable_spec'
require 'concerns/publishable_spec'
require 'concerns/blueprintable_spec'
require 'concerns/serializable_spec'

class ContentItemModel < Cms::Models::Document
  include ContentItem
  
  metadata_fields keywords: Array, author: String
end

RSpec.shared_examples "ContentItem" do
  
  it_behaves_like "UniquelyNamed" do
    let(:uniquely_named_model) { content_item_model }
  end
  
  it_behaves_like "MetaInfo" do
    let(:meta_info_model) { content_item_model }
  end  

end

RSpec.describe ContentItemModel do
  it_behaves_like "ContentItem" do
    let(:categories) { Faker::Lorem.words(2) }
    let(:tags) { Faker::Lorem.words(2) }
    let(:description) { Faker::Lorem.sentence }
    let(:content_item_model) { ContentItemModel.create name:  Faker::Lorem.characters(10), description: description, categories: categories, tags: tags }
  end
end

