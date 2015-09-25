module MetaInfo
  extend ActiveSupport::Concern

  included do
    include Describable
    include Categorizable
    include Taggable
  end
  
  class_methods do
    def metadata_field name, type
      field name, type: type
    end

    def metadata_fields fields
      fields.each {|name, type| metadata_field name, type}
    end
  end
end
