require 'spec_helper'

class UniquelyNamedModel < Cms::Models::Document
  include UniquelyNamed
end

describe UniquelyNamed do
  pending 'todo'
end
