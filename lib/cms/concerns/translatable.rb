require "cms/concerns/translator/microsoft"

module Translatable
  extend ActiveSupport::Concern

  included do
    include Localize
  end

  def translate_all
    fields_localized.each {|name| translate_field name }
  end

  def translate_field name
    send("#{name}_translations=", translate(name))
  end

  def translate field_name
    value = send field_name
    translator.translate(value) unless value.blank?
  end

  def translator
    @translator ||= Cms::Models::Translator.new(Translator::Microsoft.new)
  end
end

