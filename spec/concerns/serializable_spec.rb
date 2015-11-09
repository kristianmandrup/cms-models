require 'spec_helper'

RSpec.describe SerializableModel do
  it_behaves_like 'Serializable' do
    let(:name) { Faker::Lorem.characters(10) }
    let(:title) { Faker::Name.title }
    let(:serializable_model) { SerializableModel.create name: name, title: title }
  end
end

