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
  
  it_behaves_like "Blueprintable" do
    let(:prototype) { content_item_model }
    let(:blueprint) { prototype.blueprints.create name: Faker::Lorem.characters(10)  }
  end
  
  it_behaves_like "Serializable" do
    let(:serializable_model) { content_item_model }
  end
  
  
end
