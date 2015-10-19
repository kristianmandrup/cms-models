require 'spec_helper'
require 'concerns/named_spec'
RSpec.describe Cms::Models::Named::Image, type: :model do

  it_behaves_like "Named" do
    let(:name) { Faker::Lorem.characters(10) }
    let(:named_model) { FactoryGirl.create(:named_image, name: name) }
  end
end
