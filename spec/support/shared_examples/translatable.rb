class TranslatableTestModel < Cms::Models::Document
  include Translatable
  field :title, type: String
  field :description, type: String
  localize_fields :title, :description
end

RSpec.shared_examples "Translatable" do

  it "should translate all fields" do
    VCR.use_cassette('translation_cassette') do
      translatable_model.translate_all

      translatable_model.title_translations.each do |key,val|
        expect(translatable_model.title_translations[key]).to eq(expected_title_translations[key])
      end

      translatable_model.description_translations.each do |key,val|
        expect(translatable_model.description_translations[key]).to eq(expected_description_translations[key])
      end
    end
  end

  it 'should translate given field' do
    VCR.use_cassette('translation_cassette') do
      translatable_model.translate_field(:title)

      translatable_model.title_translations.each do |key,val|
        expect(translatable_model.title_translations[key]).to eq(expected_title_translations[key])
      end
    end
  end
end
