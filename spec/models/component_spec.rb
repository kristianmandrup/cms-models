require 'spec_helper'
require 'concerns/named_spec'
RSpec.describe Cms::Models::Component, type: :model do

  let(:component) {FactoryGirl.create(:component)}
  
  it_behaves_like 'Named' do
    let(:named_model) { component }
  end

  it 'should have valid component factory' do
    expect(component).to be_valid
  end
  
  it 'should have page field' do
    expect(Cms::Models::Component.fields.keys).to include('page')
  end

  it 'should have recursive childs' do
    child_one = component.child_components.create(FactoryGirl.attributes_for(:component))
    child_two = component.child_components.create(FactoryGirl.attributes_for(:component))
    
    expect(component.child_components.count).to eq(2)
    expect(child_one.parent_component).to equal(component)
  end
  
  it 'should have templates' do
    component
    template1 = FactoryGirl.create(:template)
    component.templates << template1
    
    template2 = FactoryGirl.create(:template)
    component.templates << template2
    expect(component.templates.count).to eq(2)
  end
  
  it 'should be hashable' do 
    component
    child_one = component.child_components.create(FactoryGirl.attributes_for(:component))
    child_two = component.child_components.create(FactoryGirl.attributes_for(:component))
    response = component.set_hash
    expect(response["name"]).to eq(component.name)
    expect(response[child_one.name]["name"]).to eq(child_one.name)
    expect(response[child_two.name]["name"]).to eq(child_two.name)
  end
  
  #it "should require a name" do
    #component.name = nil
    #expect(component).to be_invalid
  #end

  #it "should be set hash value" do
    #composit_hash = FactoryGirl.create(:component)
    
    #expect(composit_hash.set_hash["type"]).to eq("Component")

    #hash_lists =  FactoryGirl.create(:component)
    #hash_list = FactoryGirl.create(:component, composite_hash: hash_lists)
    #named_block = FactoryGirl.create(:named_block, composite_hash: hash_lists)
    #block = FactoryGirl.create(:block_list, composite_hash: hash_lists)
    #image = FactoryGirl.create(:image_list, composite_hash: hash_lists)
    
    #response = hash_lists.set_hash
    #expect(response[hash_list.name]["type"]).to eq("Component")
    #expect(response[named_block.name]["type"]).to eq("NamedBlock")
    #expect(response[block.name]["type"]).to eq("BlockList")
    #expect(response[image.name]["type"]).to eq("ImageList")
  #end
end
