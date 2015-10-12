require 'cms/models/menu/hashable'
class Cms::Models::Menu < Cms::Models::Document
  include Hashable
  include UniquelyNamed

  #embeds_many :menu_items, class_name: 'Cms::Menu::Item', inverse_of: :menu
end
