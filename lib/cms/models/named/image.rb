require 'cms/models/named/composite'
module Cms::Models::Named
  class Image < Cms::Models::Named::Composite
    has_one :image, class_name: 'Cms::Models::Image', inverse_of: :imageable
  end
end
