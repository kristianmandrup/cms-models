require 'cms/models/menu/hashable'

module Cms
  module Models
    class Menu < Composite
      extend ActiveSupport::Autoload
      include Cms::Models::Menu::Hashable
      include UniquelyNamed

      autoload :Item

      has_many :menu_items, class_name: 'Cms::Models::Composite', as: :composite_item do
        def items
          where(:_type => 'Cms::Models::Menu::Item')
        end
        def menus
          where(:_type => 'Cms::Models::Menu')
        end
      end

      def add_item(item)
        self.menu_items << item
        self.save!
      end
    end
  end
end
