# Abstract class
# TODO: throw error if instantiated directly!

require 'abstraction'
class Cms::Models::Composite < Cms::Models::Document
  abstract
  include Composite
  
  text_field :icon
  text_field :label
  text_field :link
  
  belongs_to :composite_item, polymorphic: true
  
end
