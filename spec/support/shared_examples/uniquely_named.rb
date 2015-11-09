class UniquelyNamedModel < Cms::Models::Document
  include UniquelyNamed
end

RSpec.shared_examples "UniquelyNamed" do

  describe "<<" do
    it "should present a name field" do
      expect(described_class.fields.keys).to include('name')
    end

    it "should not have empty name" do
      uniquely_named_model.name = nil
      expect(uniquely_named_model).to be_invalid
    end

    it "should have unique name" do
      uniquely_named_model
      uniquely_named_model1 = described_class.create name: uniquely_named_model.name
      expect(uniquely_named_model1).to be_invalid
    end

    it "should be valid" do
      expect(uniquely_named_model).to be_valid
    end
  end
end
