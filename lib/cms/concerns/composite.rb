module Composite
  extend ActiveSupport::Concern

  included do
    include Listable

    def type
      self.class.name
    end
  end

  class_methods do
    def get_all_lists(skip_null)
      self.all.inject([]) do |res, list|
        res << hash_for(list, skip_null)
        res
      end
    end

    def hash_for list, skip_null
      hash = {list.name => list.set_hash}
      skip_null ? hash.compact : hash
    end

  end
end
