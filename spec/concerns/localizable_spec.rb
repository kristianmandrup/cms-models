require 'spec_helper'

class LocalizableModel < Cms::Models::Document
  include Localize
  field :name, type: String
  field :title, type: String
  field :label, type: String
  
  localize_fields :title, :label
end

RSpec.shared_examples "Localize" do
  
  it "title should be localize" do
    expect(localizable_model.fields_localized).to include(:title)
  end
  
  it "label should be localize" do
    expect(localizable_model.fields_localized).to include(:label)
  end
  
  it "name should not be localize" do
    expect(localizable_model.fields_localized).not_to include(:name)
  end
  
end

RSpec.describe LocalizableModel do
  it_behaves_like "Localize" do
    let(:localizable_model) { LocalizableModel.create title: "title", name: 'name', label: 'label'}
  end
end
