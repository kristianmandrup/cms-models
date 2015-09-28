require 'spec_helper'

class TranslatableModel < Cms::Models::Document
  include Translatable
  field :title, type: String
  field :description, type: String
  localize_fields :title, :description 
end

describe Translatable do
  let(:translatable_model) { TranslatableModel.create title: 'hello', description: 'hello world' }

  
  it "should translate all fields" do
    VCR.use_cassette('translation_cassette') do
      translatable_model.translate_all

      expect(translatable_model.title_translations[:en]).to eq('hello')
      expect(translatable_model.title_translations[:es]).to eq('Hola')
      expect(translatable_model.title_translations[:fr]).to eq('Salut')
      expect(translatable_model.title_translations[:de]).to eq('Hallo')
      
      expect(translatable_model.description_translations[:en]).to eq('hello world')
      expect(translatable_model.description_translations[:es]).to eq('Hola mundo')
      expect(translatable_model.description_translations[:fr]).to eq('Salut tout le monde')
      expect(translatable_model.description_translations[:de]).to eq('Hallo Welt')
    end
  end
  
  it 'should translate given field' do
    VCR.use_cassette('translation_cassette') do
      translatable_model.translate_field(:title)
      expect(translatable_model.title_translations[:en]).to eq('hello')
      expect(translatable_model.title_translations[:es]).to eq('Hola')
      expect(translatable_model.title_translations[:fr]).to eq('Salut')
      expect(translatable_model.title_translations[:de]).to eq('Hallo')
    end
  end
    
end
