require 'spec_helper'

RSpec.describe Cms::Models::Menu::Item, type: :model do
  let(:item) {FactoryGirl.create(:item )}
  
  def field_names
    Cms::Models::Menu::Item.fields.keys
  end

  it 'should have valid template factory' do
    expect(item).to be_valid
  end
  
  it "should have icon field" do
    expect(field_names).to include('icon')
  end
  
  it "should have label field" do
    expect(field_names).to include('label')
  end
  
  it "should have link field" do
    expect(field_names).to include('link')
  end
  
  it "should required label " do
    item.label = nil
    expect(item).to be_invalid
  end
  
  it "should have fields_localized" do
    expect(item.fields_localized).to include(:label)
    expect(item.fields_localized).to include(:link)
  end
  
end
