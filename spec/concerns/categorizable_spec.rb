require 'spec_helper'

class CategorizedModel < Cms::Models::Document
  include Categorizable
end

RSpec.shared_examples "Categorizable" do 
    
  it 'should have categories' do
    expect(categorize_model.categories).to eq(['test1', 'test2'])
  end
end

RSpec.describe CategorizedModel do
  it_behaves_like "Categorizable" do
    let(:categorize_model) { CategorizedModel.create categories: %W(test1 test2) }
  end
end
