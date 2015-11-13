require 'spec_helper'

RSpec.describe Cms::Models::Menu, type: :model do

  let(:menu) {FactoryGirl.create(:menu)}

  it_behaves_like "UniquelyNamed" do
    let(:name) { Faker::Lorem.characters(10) }
    let(:uniquely_named_model) { FactoryGirl.create(:menu, name: name) }
  end

  it 'should have valid template factory' do
    expect(menu).to be_valid
  end

  it 'should have many items' do
    menu1 = FactoryGirl.create(:menu)
    menu2 = FactoryGirl.create(:menu)
    menu_item1 = FactoryGirl.create(:item)

    menu1.add_item(menu2) # add nested menu
    expect(menu1.menu_items.count).to eq(1)

    menu1.add_item(menu_item1) # add menu item
    expect(menu1.menu_items.count).to eq(2)
  end
end
