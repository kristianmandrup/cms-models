require 'cms/models/block/list/hashable'
class Cms::Models::Block::List < Cms::Models::Composite
  include Hashable
  include UniquelyNamed
  
  has_many :blocks, class_name: 'Cms::Models::Block', inverse_of: :block_list
  has_many :block_lists, class_name: 'Cms::Models::Block::List', as: :composite_item
  
  def add_list(list)
    self.block_lists << list
    self.save! 
  end
  
  def add_block(block)
    self.blocks << block 
    self.save!
  end
end
