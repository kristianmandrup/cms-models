class CategorizedModel < Cms::Models::Document
  include Categorizable
end

RSpec.shared_examples "Categorizable" do

  it 'should have categories' do
    expect(categorize_model.categories).to eq(['test1', 'test2'])
  end
end
