require 'spec_helper'

class ListableModel < Cms::Models::Document
  include Listable
  
  text_field :name
end

describe Listable do
   let(:listable_model) { ListableModel.create name: "test1", position: 1 }
   
  it "should have valid list factory" do
    expect(listable_model).to be_valid
  end
  
  it "should have orderable" do
    listable_model
    listable_model1 = ListableModel.create name: "test2", position: 2
    listable_model2 = ListableModel.create name: "test3", position: 3
    expect(listable_model.position).to eq(1)
    expect(listable_model1.position).to eq(2)
    expect(listable_model2.position).to eq(3)
    listable_model2.move_to! 1
    expect(listable_model2.position).to eq(1)
  end
end
