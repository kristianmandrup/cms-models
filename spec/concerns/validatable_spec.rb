require 'spec_helper'

RSpec.describe ValidatableModel do
  it_behaves_like "Validatable" do
    let(:validatable_model) { ValidatableModel.create name: Faker::Lorem.characters(10), title: Faker::Name.title, content: Faker::Lorem.sentence, summary: Faker::Lorem.sentence}
  end
end
