# Abstract class: Only subclass
# TODO: throw error if instantiated directly!
#require "cms/concerns/document"
module Cms
  module Models
    class Document
      include Documentable
    end
  end
end
