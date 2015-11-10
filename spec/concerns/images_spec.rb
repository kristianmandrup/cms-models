require 'spec_helper'

RSpec.describe ImagesModel do
  it_behaves_like "Images" do
     let(:image_model) {ImagesModel.create name: Faker::Name.name }
  end
end
