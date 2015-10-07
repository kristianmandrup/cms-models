class Cms::Models::Block < Cms::Models::Document
  include ContentItem
  include Listable
  include Extendable
  include Images
  include Templates
  
  field :title, type: String
  field :content, type: String
  field :summary, type: String
  
  metadata_fields keywords: Array, author: String
  
  fields_validation
  blueprint!
  
  tracks :name

  # belongs_to :block_lists, class_name: 'Cms::BlockList', inverse_of: :blocks
  # belongs_to :named_block, class_name: 'Cms::NamedBlock', inverse_of: :block
end


