module Serializable
  extend ActiveSupport::Concern

  included do
    def as_json(options={})
      super(:only => api_attributes, :methods => :type)
    end

    def api_attributes
      @api_attributes ||= potential_api_attributes.select do |name|
        has_field? name
      end
    end

    def potential_api_attributes
      default_api_attributes.concat(my_api_attributes)
    end

    def my_api_attributes
      []
    end

    def default_api_attributes
      [:title, :label, :link, :icon, :categories, :tags, :description, :content]
    end
  end
end
