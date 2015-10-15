require 'spec_helper'
require 'concerns/uniquely_named_spec'
RSpec.describe Cms::Models::Menu, type: :model do

  let(:menu) {FactoryGirl.create(:menu)}
  
  def field_names
    Cms::Models::Menu.fields.keys
  end
  
  def test_menu_items(response, menu_items)
    menu_items.items.each_with_index do |item, index|
      test_item(response['items'][index], item)
    end
    
    menu_items.menus.each_with_index do |menu, index|
      test_menu(response[menu.name], menu)
      test_menu_items(response[menu.name]['menu_items'], menu.menu_items)
    end
  end
  
  def test_menu(response, menu)
    expect(response['type']).to eq(menu.type)
    expect(response['name']).to eq(menu.name)
  end
  
  def test_item(response, item)
    expect(response['icon']).to eq(item.icon)
    expect(response['label']).to eq(item.label)
    expect(response['link']).to eq(item.link)
  end
  
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
  
  it "should be hashable" do
    menu1 = FactoryGirl.create(:menu)
    menu2 = FactoryGirl.create(:menu)
    menu_item1 = FactoryGirl.create(:item)
    menu_item2 = FactoryGirl.create(:item)
    
    menu1.add_item(menu2)
    menu1.add_item(menu_item1)
    menu2.add_item(menu_item2)
    
    response = menu1.set_hash
    test_menu(response, menu1)
    test_menu_items(response['menu_items'], menu1.menu_items)
  end
end
