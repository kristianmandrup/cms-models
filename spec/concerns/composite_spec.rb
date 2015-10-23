require 'spec_helper'

class CompositeModel < Cms::Models::Document
  include Composite
  
  field :name,  type: String
  
  belongs_to :list, polymorphic: true
end

class ListModel < CompositeModel
  has_many :composite_models , as: :list
  
  def set_hash
      hash = {}
      hash['type'] = self.type
      hash['name'] = self.name
      self.composite_models.each do |list|
        hash[list.name] = {}
        hash[list.name] = list.set_hash
      end
      hash
  end
    
end

describe Composite do
  let(:composite_model) { ListModel.create name: Faker::Lorem.characters(10), position: 0 }
  it "should be orderable" do
    composite_model
    composite_model1 = ListModel.create name: Faker::Lorem.characters(10),position: 1
    composite_model2 = ListModel.create name: Faker::Lorem.characters(10),position: 2
    
    expect(composite_model.position).to eq(0)
    expect(composite_model1.position).to eq(1)
    expect(composite_model2.position).to eq(2)
    
    composite_model.move_to! 1
    expect(composite_model.position).to eq(1)
  end
  
  it "should return type" do
    expect(composite_model.type).to eq("ListModel")
  end
  
  it "should get all list" do
     list = ListModel.create name: Faker::Lorem.characters(10), position: 0
     list_item1 = ListModel.create name: Faker::Lorem.characters(10), position: 0
     list_item2 = ListModel.create name: Faker::Lorem.characters(10), position: 0
     list.composite_models << list_item1
     list.composite_models << list_item2
     lists = ListModel.get_all_lists(true)
  end
  
end
