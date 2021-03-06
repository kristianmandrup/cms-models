# A Component is a hash
require 'cms/models/component/hashable'
class Cms::Models::Component < Cms::Models::Composite
  include Hashable
  include Named

  field :page, type: Boolean, default: false

  recursively_embeds_many
  has_many :templates, class_name: 'Cms::Models::Template', as: :templatable
end
