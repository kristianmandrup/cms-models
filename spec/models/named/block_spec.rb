require 'spec_helper'

RSpec.describe Cms::Models::Named::Block, type: :model do

  it_behaves_like "Named" do
    let(:name) { Faker::Lorem.characters(10) }
    let(:named_model) { FactoryGirl.create(:named_block, name: name) }
  end

  it "should have one block" do
    name_block = FactoryGirl.create(:named_block)
    params = FactoryGirl.attributes_for(:block)
    name_block.build_block(params)
    name_block.save!
    expect(name_block.block.name).to eq(params[:name])
  end

end
