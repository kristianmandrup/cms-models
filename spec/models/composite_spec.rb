require 'spec_helper'
RSpec.describe Cms::Models::Composite, type: :model do

  it 'should have not be instantiated' do
    expect{Cms::Models::Composite.new }.to raise_error(AbstractClassError)
  end
  
end
