require 'spec_helper'
require 'concerns/uniquely_named_spec'
RSpec.describe Cms::Models::Block::List, type: :model do

  let(:block_list) {FactoryGirl.create(:block_list)}
  
  def field_names
    Cms::Models::Block::List.fields.keys
  end
  
  def test_block_list(response, block_list)
    expect(response['type']).to eq(block_list.type)
    expect(response['name']).to eq(block_list.name)
    
    block_list.blocks.each_with_index do |block, index|
      test_block(response['blocks'][index], block)
    end
    
    block_list.block_lists.each do |list|
      test_block_list(response[list.name], list)
    end
  end
  
  def test_block(response, block)
    expect(response['name']).to eq(block.name)
    expect(response['title']).to eq(block.title)
    expect(response['content']).to eq(block.content)
  end
  
  it_behaves_like "UniquelyNamed" do
    let(:name) { Faker::Lorem.characters(10) }
    let(:uniquely_named_model) { FactoryGirl.create(:block_list, name: name) }
  end
  
  it 'should have valid template factory' do
    expect(block_list).to be_valid
  end
  
  
  it 'should have many block' do
    block_list1 = FactoryGirl.create(:block_list)
    
    block_list1.block_lists.create(FactoryGirl.attributes_for(:block_list))
    expect(block_list1.block_lists.count).to eq(1)
    
    block_list1.blocks.create(FactoryGirl.attributes_for(:block))
    expect(block_list1.blocks.count).to eq(1)
  end
  
  it "should be hashable" do
    block_list1 = FactoryGirl.create(:block_list)
    block_list2 = FactoryGirl.create(:block_list)
    block1 = FactoryGirl.create(:block)
    block2 = FactoryGirl.create(:block)
    
    block_list1.add_list(block_list2)
    block_list1.add_block(block1)
    block_list2.add_block(block2)
    response = block_list1.set_hash
    
    test_block_list(response, block_list1)
  end
end
