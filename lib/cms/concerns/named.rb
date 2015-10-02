module Named
  extend ActiveSupport::Concern

  included do
    # name is an identifier, used by REST API
    field :name, type: String

    include Validatable
    fields_validation
  end
end
