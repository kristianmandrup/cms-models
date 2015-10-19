require 'cms/models/named/composite'
module Cms::Models::Named
  class Block < Cms::Models::Named::Composite
    has_one :block, class_name: "Cms::Models::Block", inverse_of: :named_block
  end
end
