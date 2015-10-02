require 'spec_helper'

class ValidatableModel < Cms::Models::Document
  include Validatable
  
  field :name, type: String
  field :title, type: String
  field :content, type: String
  field :summary, type: String
  
  fields_validation
end

describe Validatable do
  let(:validatable_model) { ValidatableModel.create name: Faker::Lorem.characters(10), title: 'test title', content: 'test content', summary: 'test summary'}
  
  it "should require name" do
    validatable_model.name = nil
    expect(validatable_model).to be_invalid
  end
  
  it "should not have name length less than 2 " do
    validatable_model.name = 'a'
    expect(validatable_model).to be_invalid
  end
  
  it "should require title" do
    validatable_model.title = nil
    expect(validatable_model).to be_invalid
  end
  
  it "should require content" do
    validatable_model.content = nil
    expect(validatable_model).to be_invalid
  end
  
  it "should not require summary" do
    validatable_model.summary = nil
    expect(validatable_model).to be_valid
  end
end
