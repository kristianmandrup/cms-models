require 'cms/concerns'

module Cms
  module Models
    extend ActiveSupport::Autoload

    def self.version_string
      "Cms version #{VERSION}"
    end

    autoload :Version
    autoload :Document
    autoload :ProtoTypeBuilder
    autoload :Attribute
    autoload :Translator
    autoload :HistoryTracker
    autoload :Template
    autoload :Block
    autoload :Image
    autoload :Composite
    autoload :Component
    autoload :Menu
    autoload :Named
    autoload :Page
    autoload :Uploaders
  end
end
