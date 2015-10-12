require 'spec_helper'
require 'concerns/uniquely_named_spec'
RSpec.describe Cms::Models::Menu, type: :model do

  let(:menu) {FactoryGirl.create(:menu)}
  
  def field_names
    Cms::Models::Menu.fields.keys
  end
  
  it_behaves_like "UniquelyNamed" do
    let(:name) { Faker::Lorem.characters(10) }
    let(:uniquely_named_model) { FactoryGirl.create(:menu, name: name) }
  end

  it 'should have valid template factory' do
    expect(menu).to be_valid
  end
  
  #it 'should have many items' do
    
  #end
  
end
