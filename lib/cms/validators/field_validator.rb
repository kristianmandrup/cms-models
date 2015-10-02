module Cms
  module Validators
    class FieldValidator
      # name is the field name for which validations are added
      attr_reader :model, :name

      def initialize model, name
        @model, @name = [model, name]
      end

      # http://api.rubyonrails.org/classes/ActiveModel/Validations/ClassMethods.html
      def add_validations
        required_field && named_field
      end

      def required_field
        model.validates name, presence: true if required_field?
      end

      def named_field
        model.validates name, length: { minimum: 2, maximum: 30 } if named_field?
        model.validates_format_of name, with: /\A(?=.*[a-z])[a-z\d]+\Z/i  if named_field?
      end

      def named_field?
        name.to_sym == :name
      end

      def required_field?
        required_fields.include? name
      end

      def required_fields
        [:name, :label, :title, :content]
      end
    end
  end
end
