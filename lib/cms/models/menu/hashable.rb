module Cms
  module Models
    class Menu < Composite
      module Hashable
        extend ActiveSupport::Concern
        def set_hash
          hash = {
            'type' => type,
            'name' => name,
            'menu_items' => {
              'items' => list_items_hash
            }
          }

          menu_items.menus.each do |menu|
            hash['menu_items'][menu.name] = menu.set_hash
          end
          hash
        end

        private
          def list_items_hash
            menu_items.items.as_json(only: [:icon, :link, :label], methods: [:type])
          end

        module ClassMethods
          def set_hash
            all.map(&:set_hash)
          end
        end
      end
    end
  end
end
