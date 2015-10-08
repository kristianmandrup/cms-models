require 'spec_helper'

class ExtendableModel < Cms::Models::Document
  include Extendable
  
  field :name, type: String
end

RSpec.shared_examples "Extendable" do
  
  it "should be valid" do
    expect(extendable_model).to be_valid
  end
  
  it "should have genric attributes" do
    generic_attributes = extendable_model.generic_attributes
    expect(generic_attributes.count).to eq(2)
    
    generic_attributes.each_with_index do |generic_attribute, index|
      expect(generic_attribute.caption).to eq(generic_attributes_array[index][:caption])
      expect(generic_attribute.generic_type).to eq(described_class.to_s)
    end
  end
end

RSpec.describe ExtendableModel do
  
  it_behaves_like "Extendable" do
    let(:extendable_model) { ExtendableModel.create(name: Faker::Lorem.characters(10), generic_attributes_attributes: generic_attributes_array) }
  end
end
