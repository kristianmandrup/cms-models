module ContentItem
  extend ActiveSupport::Concern

  included do
    include UniquelyNamed
    include Metadata
    include Translatable
    include Validatable
    include Renderable
    include Publishable
    include Blueprintable 
    include Serializable
    tracks :all
  end
end

