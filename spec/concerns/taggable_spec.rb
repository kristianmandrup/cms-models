require 'spec_helper'

class TaggableModel < Cms::Models::Document
  include Taggable
end

describe Taggable do
  let(:taggable_model) { TaggableModel.create tags: ['tag1','tag2','tag3'] }
  
  it "should have tags field" do
    expect(TaggableModel.fields.keys).to include('tags')
  end
  
  it "should store array of tag" do
    expect(taggable_model.tags).to eq(['tag1','tag2','tag3'])
  end
end
