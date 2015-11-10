require 'spec_helper'

RSpec.describe UploadableModel do
  it_behaves_like "Uploadable" do
    let(:uploadable_model) { UploadableModel.create }
  end
end
