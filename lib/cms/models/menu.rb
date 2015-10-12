require 'cms/models/menu/hashable'
require 'cms/models/menu/item'
class Cms::Models::Menu < Cms::Models::Document
  include Hashable
  include UniquelyNamed

  embeds_many :menu_items, class_name: 'Cms::Models::Menu::Item', inverse_of: :menu
end
