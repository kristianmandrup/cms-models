module Templates
  extend ActiveSupport::Concern

  included do
    has_many :templates, class_name: 'Cms::Models::Template', as: :templatable
  end
end
