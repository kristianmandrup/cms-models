require 'spec_helper'

RSpec.describe MetaInfoModel do
  it_behaves_like "MetaInfo" do
    let(:categories) { Faker::Lorem.words(2) }
    let(:tags) { Faker::Lorem.words(2) }
    let(:description) { Faker::Lorem.sentence }
    let(:meta_info_model) { MetaInfoModel.create description: description, categories: categories, tags: tags }
  end
end
