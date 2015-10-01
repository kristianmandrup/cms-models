require 'spec_helper'

class TemplatesModel < Cms::Models::Document
  include Templates
  field :name, type: String
end

describe Templates do
  let(:template_model) { TemplatesModel.create name: Faker::Name.name}
  
  it 'should be valid' do
    expect(template_model).to be_valid
  end
  
  it "should have templates" do
    template_model.templates << FactoryGirl.create(:template)
    expect(template_model.templates.count).to eq(1)
  end
  
end
