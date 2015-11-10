require 'spec_helper'

RSpec.describe ExtendableModel do
  it_behaves_like "Extendable" do
    let(:extendable_model) { ExtendableModel.create(name: Faker::Lorem.characters(10), generic_attributes_attributes: generic_attributes_array) }
  end
end
