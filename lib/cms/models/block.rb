class Cms::Models::Block < Cms::Models::Document
  include ContentItem
  include Listable
  
  field :title, type: String
  field :content, type: String
  
  validates :title, presence: true    
  validates :content, presence: true    
  
  #blueprint!

  # belongs_to :block_lists, class_name: 'Cms::BlockList', inverse_of: :blocks
  # belongs_to :named_block, class_name: 'Cms::NamedBlock', inverse_of: :block
end


