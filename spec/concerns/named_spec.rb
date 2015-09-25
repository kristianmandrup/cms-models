require 'spec_helper'

class NamedModel < Cms::Models::Document
  include Named
end

describe Named do
  let(:named_model) {NamedModel.create name: 'test name'}
  it "should have name" do
    expect(named_model.name).to eq('test name')
  end
  
  it "should validate name presence" do
    named_model.name = nil
    expect(named_model).to be_invalid
  end
end
