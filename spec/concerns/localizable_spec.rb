require 'spec_helper'

RSpec.describe LocalizableModel do
  it_behaves_like "Localize" do
    let(:localizable_model) { LocalizableModel.create title: "title", name: 'name', label: 'label'}
  end
end
