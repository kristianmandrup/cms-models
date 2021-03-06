class PrototypeModel

  include Mongoid::Document

  field :name, type: String
  field :title, type: String

  def blueprint_attributes
    nil
  end
end

class BlueprintModel < PrototypeModel
  include Blueprintable

  blueprint
end

class SimpleBlueprintModel

  include Mongoid::Document
  include Blueprintable

  field :name, type: String
  field :title, type: String
  blueprint # implicit self

  def blueprint_attributes
    [:name, :title]
  end
end

RSpec.shared_examples "Blueprintable" do

  #context 'one blueprint model' do

    #let(:prototype) { SimpleBlueprintModel.create name: 'prototype', title: 'hello world' }
    #let(:blueprint) { prototype.blueprints.create  }

    #it 'should transfer name value from prototype to blueprint' do
      #expect(blueprint.name).to eq(prototype.name)
    #end

    #it 'should NOT transfer title value from prototype to blueprint' do
      #expect(blueprint.title).not_to eq(prototype.title)
    #end
  #end


  context 'blueprint model is created with prototype' do
    it 'should transfer all field values from prototype to blueprint' do
      keys = prototype.fields.keys - ['_id', 'prototype_id', 'updated_at','created_at', 'name']
      keys.each do |key|
        expect(blueprint[key]).to eq(prototype[key])
      end
    end
  end
end
