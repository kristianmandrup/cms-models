require 'spec_helper'

RSpec.describe BlueprintModel do
  it_behaves_like "Blueprintable" do
    let(:prototype) { BlueprintModel.create name: 'prototype', title: 'hello world' }
    let(:blueprint) { prototype.blueprints.create name: Faker::Lorem.characters(10)  }
  end
end


RSpec.describe SimpleBlueprintModel do
  it_behaves_like "Blueprintable" do
    let(:prototype) { SimpleBlueprintModel.create name: 'prototype', title: 'hello world' }
    let(:blueprint) { prototype.blueprints.create name: Faker::Lorem.characters(10) }
  end
end
