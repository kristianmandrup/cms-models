require 'spec_helper'

RSpec.describe TaggableModel do
  it_behaves_like "Taggable" do
    let(:tags) { Faker::Lorem.words(4) }
    let(:taggable_model) { TaggableModel.create tags: tags }
  end
end
