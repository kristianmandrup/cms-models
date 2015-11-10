class ListableModel < Cms::Models::Document
  include Listable

  text_field :name
end

RSpec.shared_examples "Listable" do

  it "should have valid list factory" do
    expect(listable_model).to be_valid
  end

  it "should have orderable" do
    expect(listable_model.position).to eq(1)
    expect(listable_model1.position).to eq(2)
    expect(listable_model2.position).to eq(3)

    listable_model2.move_to! 1
    expect(listable_model2.position).to eq(1)
  end
end
