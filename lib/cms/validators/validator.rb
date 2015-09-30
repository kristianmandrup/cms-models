module Cms
  module Validators
    class Validator < ActiveModel::Validator
      attr_reader :record

      def validate record
        @record = record
        # do your runtime validation magic!
      end

      protected

    end
  end
end
