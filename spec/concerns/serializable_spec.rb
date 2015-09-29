require 'spec_helper'

class SerializableModel < Cms::Models::Document
  include Serializable
end

describe Serializable do
  let(:serializable_model) { SerializableModel.create }
  
end
