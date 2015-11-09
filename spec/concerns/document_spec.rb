require 'spec_helper'

RSpec.describe DocumentModel do
  it_behaves_like "Documentable" do
    let(:document_model) { DocumentModel.create name: 'test'}
  end
end
