class SerializableModel < Cms::Models::Document
  include Serializable

  field :name , type: String
  field :title, type: String

  # default api attributes [:title, :label, :link, :icon, :categories, :tags, :description, :content]
  # expose other attributes in serializable_attributes method
  def serializable_attributes
    [:name]
  end
end

RSpec.shared_examples 'Serializable' do
  it 'should serialize name if expose in my_api_attributes method' do
    response = JSON.parse(serializable_model.to_json)
    expect(response['name']).to eq(name)
  end

  it 'should serialize title by default' do
    response = JSON.parse(serializable_model.to_json)
    expect(response['title']).to eq(title)
  end
end
