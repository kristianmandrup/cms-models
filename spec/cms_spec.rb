require 'spec_helper'

describe Cms::Models do
  it 'should return correct version string' do
    expect(Cms::Models.version_string).to eq("Cms version #{Cms::Models::VERSION}")
  end
end
