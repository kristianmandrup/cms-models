require 'spec_helper'

RSpec.describe CategorizedModel do
  it_behaves_like "Categorizable" do
    let(:categorize_model) { CategorizedModel.create categories: %W(test1 test2) }
  end
end
