require 'spec_helper'

RSpec.describe NamedModel do
  it_behaves_like "Named" do
    let(:named_model) {NamedModel.create name: Faker::Lorem.characters(10) }
  end
end
