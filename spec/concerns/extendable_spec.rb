require 'spec_helper'

class ExtendableModel < Cms::Models::Document
  include Extendable
  field :name, type: String
end

describe Extendable do
  
  let(:extendable_model) { ExtendableModel.create name: "test" }
  
  it "should be valid" do
    expect(extendable_model).to be_valid
  end
  
  it "should have genric attributes"
end
