require 'spec_helper'

class UniquelyNamedModel < Cms::Models::Document
  include UniquelyNamed
end

describe UniquelyNamed do
  let(:publishable_model) { UniquelyNamedModel.create name: 'test name' }
  
  it "should present a name field" do
    expect(UniquelyNamedModel.fields.keys).to include('name')
  end
  
  it "should not have empty name" do
    publishable_model.name = nil
    expect(publishable_model).to be_invalid
  end
  
  it "should have unique name" do
    publishable_model
    publishable_model1 = UniquelyNamedModel.create name: 'test name'
    expect(publishable_model1).to be_invalid
  end
  
end
