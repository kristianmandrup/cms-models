require 'spec_helper'

class MetaInfoModel < Cms::Models::Document
  include MetaInfo
  
  metadata_fields keywords: Array, author: String
end

describe MetaInfo do
  let(:meta_info_model) { MetaInfoModel.create description: 'test description', categories: ['test1','test2'], tags: ['tag1','tag2'] }
  it "should have description field"do
    expect(meta_info_model.description).to eq('test description')
  end
  
  it "should have categories" do
    expect(meta_info_model.categories).to include('test1')
    expect(meta_info_model.categories).to include('test2')
  end
  
  it "should have tags" do
    expect(meta_info_model.tags).to include('tag1')
    expect(meta_info_model.tags).to include('tag2')
  end
  
  it "should have meta fields" do
    expect(MetaInfoModel.fields.keys).to include('keywords')
    expect(MetaInfoModel.fields.keys).to include('author')
  end
  
end
