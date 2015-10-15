require 'cms/models/menu/hashable'
require 'cms/models/menu/item'
class Cms::Models::Menu < Cms::Models::Composite
  include Hashable
  include UniquelyNamed

  #embeds_many :menu_items, class_name: 'Cms::Models::Menu::Item', inverse_of: :menu
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
