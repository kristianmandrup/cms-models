module Cms
  module Models
    module Attribute
      class Generic < Cms::Models::Document
        field :caption, type: String
        field :filters, type: String
        field :input, type: String
        field :output, type: String
        field :value, type: String

        belongs_to :generic, :polymorphic => true
      end
    end
  end
end
