module Images
  extend ActiveSupport::Concern

  included do
    has_many :images, class_name: 'Cms::Models::Image', as: :imageable
  end
end
