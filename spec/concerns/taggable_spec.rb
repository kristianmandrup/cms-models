require 'spec_helper'

class TaggableModel < Cms::Models::Document
  include Taggable
end

RSpec.shared_examples "Taggable" do
  
  it "should have tags field" do
    expect(TaggableModel.fields.keys).to include('tags')
  end
  
  it "should store array of tag" do
    expect(taggable_model.tags).to eq(tags)
  end
end

RSpec.describe TaggableModel do
  it_behaves_like "Taggable" do
    let(:tags) { Faker::Lorem.words(4) }
    let(:taggable_model) { TaggableModel.create tags: tags }
  end
end
