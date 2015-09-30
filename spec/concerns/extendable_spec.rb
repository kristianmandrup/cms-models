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
  
  it "should have genric attributes" do
    extendable_model = ExtendableModel.create(
                                      name: "test", 
                                      generic_attributes_attributes: 
                                      [
                                          {caption: 'caption1', input: 'input1', output: 'output1', value: 'value1' },
                                          {caption: 'caption2', input: 'input2', output: 'output2', value: 'value2' }
                                      ]
                        )
    generic_attributes = extendable_model.generic_attributes
    expect(generic_attributes.count).to eq(2)
    
    expect(generic_attributes[0].caption).to eq('caption1')
    expect(generic_attributes[0].generic_type).to eq('ExtendableModel')
    
    expect(generic_attributes[1].caption).to eq('caption2')
    expect(generic_attributes[1].generic_type).to eq('ExtendableModel')
  end
end
