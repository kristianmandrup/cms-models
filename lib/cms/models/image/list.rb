require 'cms/models/image/list/hashable'
class Cms::Models::Image::List < Cms::Models::Composite
  include Hashable
  include UniquelyNamed
  
  has_many :images, class_name: 'Cms::Models::Image', as: :imageable
  has_many :image_lists, class_name: 'Cms::Models::Image::List', as: :composite_item
  
  def add_list(list)
    self.image_lists << list
    self.save! 
  end
  
  def add_image(image)
    self.images << image 
    self.save!
  end
end
