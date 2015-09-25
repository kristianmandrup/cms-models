module Taggable
  extend ActiveSupport::Concern

  included do
    field :tags,        type: Array
  end
end