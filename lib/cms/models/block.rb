module Cms
  module Models
    class Block < Cms::Models::Document
      extend ActiveSupport::Autoload

      autoload :List

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
      localize_fields :title, :description
      blueprint!

      # [FIXME]: We are already tracking +:all+ in +ContentItem+ module, do
      # we really this?
      tracks :name

      belongs_to :block_list, class_name: 'Cms::Models::Block::List', inverse_of: :blocks
      belongs_to :named_block, class_name: 'Cms::Models::Named::Block', inverse_of: :block


      def blueprint_attributes
        nil
      end

      def serializable_attributes
        [:name]
      end
    end
  end
end
