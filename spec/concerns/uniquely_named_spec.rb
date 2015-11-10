require 'spec_helper'

RSpec.describe UniquelyNamedModel do
  it_behaves_like "UniquelyNamed" do
    let(:name) { Faker::Lorem.characters(10) }
    let(:uniquely_named_model) { UniquelyNamedModel.create name: name }
  end
end
