require 'spec_helper'

RSpec.describe Cms::Models::Template, type: :model do

  let(:template) {FactoryGirl.create(:template)}

  def field_names
    Cms::Models::Template.fields.keys
  end

  it_behaves_like "UniquelyNamed" do
    let(:name) { Faker::Lorem.characters(10) }
    let(:uniquely_named_model) { FactoryGirl.create(:template, name: name) }
  end

  it 'should have valid template factory' do
    expect(template).to be_valid
  end

  it 'should have format field with default value html' do
    expect(template.format).to eq('html')
  end

  it 'should have handler field with default value liquid' do
    expect(template.handler).to eq('liquid')
  end

  it 'should have type field with default value template' do
    expect(template.type).to eq('template')
  end

  it 'should have template field' do
    expect(field_names).to include('template')
  end

end
