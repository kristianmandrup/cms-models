class Cms::Models::Menu::Item < Cms::Models::Composite
  # a link can point to different resource depending on locale
  include Translatable
  include Validatable
  
  text_field :icon
  text_field :label
  text_field :link
  
  fields_validation
  localize_fields :label, :link
  
  #embeds_one :image, class_name: 'Cms::Image', as: :imageable, polymorphic: true
  #embedded_in :menu, class_name: 'Cms::Models::Menu', inverse_of: :menu_items
end
