require 'spec_helper'

class CategorizedModel < Cms::Models::Document
  include Categorizable
end

describe Categorizable do
  
  let(:categorize_model) { CategorizedModel.create categories: %W(test1 test2) }
    
  it 'should have categories' do
    expect(categorize_model.categories).to eq(['test1', 'test2'])
  end
end
