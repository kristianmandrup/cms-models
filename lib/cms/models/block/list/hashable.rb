class Cms::Models::Block::List < Cms::Models::Composite
  module Hashable
    def set_hash
      hash = {}
      hash['type'] = self.type
      hash['name'] = self.name
      hash['blocks'] = block_hash
      self.block_lists.each do |list|
        hash[list.name] = {}
        hash[list.name] = list.set_hash
      end
      hash
    end

    private

    def block_hash
      self.blocks.as_json(only: [:name, :title, :content, :categories, :tags, :description, :position], methods: [:type])
    end
  end
end
