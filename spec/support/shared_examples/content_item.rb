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
