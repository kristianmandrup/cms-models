require 'spec_helper'

RSpec.describe PublishableModel do
  it_behaves_like "Publishable" do
     let(:publishable_model) { PublishableModel.create }
  end
end

