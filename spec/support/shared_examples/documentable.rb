class DocumentModel < Cms::Models::Document

  field :name, type: String

  tracks :name
end

RSpec.shared_examples "Documentable" do

  before :each do
    document_model
  end

  it "should be valid" do
    expect(document_model).to be_valid
  end

  it "should be trackable" do
    name1 = Faker::Lorem.characters(10)
    name2 = Faker::Lorem.characters(10)
    document_model.update!(name: name1)
    document_model.update!(name: name2)
    expect(document_model.name).to eq(name2)
    expect(document_model.history_tracks.count).to eq(2)
    document_model.undo!
    expect(document_model.name).to eq(name1)
  end

  it "should be type" do
    expect(document_model.type).to eq(described_class.to_s)
  end

  #it "should be apply_concerns"


  it "should have field" do
    has_field = DocumentModel.has_field? :name
    expect(has_field).to be true
  end
end
