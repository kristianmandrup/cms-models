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
