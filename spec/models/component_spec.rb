require 'spec_helper'

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

  it "should have root component page " do
    page = Cms::Models::Page.create(FactoryGirl.attributes_for(:component))
    page1 = Cms::Models::Page.find(:name => page.name)
    expect(page1).to eq(page)
  end

end
