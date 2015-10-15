# Abstract class
# TODO: throw error if instantiated directly!

require 'abstraction'
class Cms::Models::Composite < Cms::Models::Document
  abstract
  include Composite
  
  belongs_to :composite_item, polymorphic: true
end
