require 'spec_helper'

RSpec.describe ListableModel do
  it_behaves_like "Listable" do
    let(:listable_model) { ListableModel.create name: "test1", position: 1 }
    let(:listable_model1) { ListableModel.create name: "test2", position: 2 }
    let(:listable_model2) { ListableModel.create name: "test3", position: 3 }
  end
end
