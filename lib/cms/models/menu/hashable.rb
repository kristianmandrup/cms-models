class Cms::Models::Menu < Cms::Models::Composite
  module Hashable
    def set_hash
      hash = {}
      hash['type'] = self.type
      hash['name'] = self.name
      hash['menu_items'] = { 'items' => list_items_hash }
      menu_items.where(_type: 'Cms::Models::Menu').each do |item|
        hash['menu_items'][item.name] = {}
        hash['menu_items'][item.name] = item.set_hash
      end
      hash
    end

    private

    def list_items_hash
      menu_items.where(_type: 'Cms::Models::Menu::Item').as_json(only: [:icon, :link, :label], methods: [:type])
    end
  end
end

