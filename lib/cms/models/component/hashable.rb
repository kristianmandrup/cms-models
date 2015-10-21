class Cms::Models::Component < Cms::Models::Composite
  module Hashable
    # TODO: All this hash logic should be extracted to a Concern or utility class
    def set_hash
      hash = {}
      hash['name'] = self.name
      hash['type'] = self.type
      child_components.each do |item|
        set_hash_by item, hash
      end
      hash
    end

    def set_hash_by item, hash
      hash[item.name] = {}
      hash[item.name]['type'] = item.type if item.type

      case item._type
      when 'Cms::Models::Component'
        hash[item.name] = item.set_hash
      when 'Cms::Models::Block::List'
        hash[item.name]['blocks'] = blocks_hash item
      when 'Cms::Models::Image::List'
        hash[item.name]['images'] = images_hash item
      when 'Cms::Models::Named::Block'
        hash[item.name]['block'] = block_hash item
      when 'Cms::Models::Named::Image'
        hash[item.name]['image'] = image_hash item
      end
    end

    private

    def image_hash item
      item.image.as_json(only: [:title], methods: [:type])
    end

    def block_hash item
      item.block.as_json(only: [:title], methods: [:type])
    end

    def images_hash item
      item.images.collect{ |image| image.as_json(only: [:title], methods: [:type])}
    end

    def blocks_hash item
      item.blocks.collect{ |block| block.as_json(only: [:title], methods: [:type])}
    end
  end
end
