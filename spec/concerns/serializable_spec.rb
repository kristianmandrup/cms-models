require 'spec_helper'

class SerializableModel < Cms::Models::Document
  include Serializable
  
  field :name , type: String
  field :title, type: String

  
  def my_api_attributes
    [:name]
  end
end

describe Serializable do
  let(:serializable_model) { SerializableModel.create name: 'test', title: 'title1' }
  
  it "should serialize name if expose in my_api_attributes method" do
    response = JSON.parse(serializable_model.to_json)
    expect(response["name"]).to eq('test')
  end
  
  it "should serialize title by default" do
    response = JSON.parse(serializable_model.to_json)
    expect(response["title"]).to eq('title1')
  end
  
end
