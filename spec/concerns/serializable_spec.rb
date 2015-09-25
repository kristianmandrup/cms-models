require 'spec_helper'

class SerializableModel < Cms::Models::Document
  include Serializable
end

describe Serializable do
  pending 'todo'
end
