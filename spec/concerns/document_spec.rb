require 'spec_helper'

class DocumentModel < Cms::Models::Document
  
  field :name, type: String
  
  tracks :name
end

describe Documentable do
  let(:document_model) { DocumentModel.create name: 'test'}
  
  before :each do
    document_model
  end
  
  it "should be valid" do
    expect(document_model).to be_valid
  end
  
  it "should be trackable" do
  
  puts document_model.attributes
    document_model.update(name: 'test1')
    document_model.update(name: 'test2')
    expect(document_model.name).to eq('test2')
    expect(document_model.history_tracks.count).to eq(2)
    document_model.undo!
    expect(document_model.name).to eq('test1')
  end
  
  it "should be type" do
    expect(document_model.type).to eq("DocumentModel")
  end
  
  it "should be apply_concerns" do
  end

  
  it "should have field" do
    has_field = DocumentModel.has_field? :name
    expect(has_field).to be true
  end
end
