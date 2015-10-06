require 'spec_helper'

class MetaInfoModel < Cms::Models::Document
  include MetaInfo
  
  metadata_fields keywords: Array, author: String
end

RSpec.shared_examples "MetaInfo" do 
  
  it "should have description field"do
    expect(meta_info_model.description).to eq(description)
  end
  
  it "should have categories" do
    expect(meta_info_model.categories).to match_array(categories)
  end
  
  it "should have tags" do
    expect(meta_info_model.tags).to match_array(tags)
  end
  
  it "should have meta fields" do
    expect(described_class.fields.keys).to include('keywords')
    expect(described_class.fields.keys).to include('author')
  end
  
end

RSpec.describe MetaInfoModel do
  it_behaves_like "MetaInfo" do
    let(:categories) { Faker::Lorem.words(2) }
    let(:tags) { Faker::Lorem.words(2) }
    let(:description) { Faker::Lorem.sentence }
    let(:meta_info_model) { MetaInfoModel.create description: description, categories: categories, tags: tags }
  end
end
