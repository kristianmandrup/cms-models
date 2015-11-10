require 'spec_helper'

RSpec.describe TranslatableTestModel do
  it_behaves_like "Translatable" do
    let(:translatable_model) { TranslatableTestModel.create title: expected_title_translations['en'], description: expected_description_translations['en'] }
  end
end

