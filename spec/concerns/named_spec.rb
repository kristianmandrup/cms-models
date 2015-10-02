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
  
  it "should have name length between 2 and 30" do
    named_model.name = Faker::Lorem.characters(1)
    expect(named_model).to be_invalid
    
    named_model.name = Faker::Lorem.characters(3)
    expect(named_model).to be_valid
    
    named_model.name = Faker::Lorem.characters(31)
    expect(named_model).to be_invalid
  end
  
  it "should have name wtih alphanumeric char only" do
    named_model.name = '123'
    expect(named_model).to be_invalid
    
    named_model.name = 'ab123'
    expect(named_model).to be_valid
    
    named_model.name = 'abc'
    expect(named_model).to be_valid
  end
  
end
