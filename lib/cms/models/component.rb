# A Component is a hash
require 'cms/models/component/hashable'
class Cms::Models::Component < Cms::Models::Composite
  include Hashable
  include Named

  field :page, type: Boolean

  #recursively_embeds_many
  #has_many :templates, class_name: 'Cms::Template', as: :templatable
end
