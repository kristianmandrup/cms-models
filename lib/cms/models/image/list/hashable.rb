class Cms::Models::Image::List < Cms::Models::Composite
  module Hashable
    def set_hash
      hash = {}
      hash['type'] = self.type
      hash['name'] = self.name
      hash['images'] = image_hash
      self.image_lists.each do |list|
        hash[list.name] = {}
        hash[list.name] = list.set_hash
      end
      hash
    end

    private

    def image_hash
      self.images.as_json(only: [:name, :title, :content, :categories, :tags, :description, :position], methods: [:type, :url])
    end
  end
end
