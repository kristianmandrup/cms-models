require 'spec_helper'

class TaggableModel < Cms::Models::Document
  include Taggable
end

describe Taggable do
  pending 'todo'
end
