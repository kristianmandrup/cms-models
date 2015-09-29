require 'spec_helper'
class UploadableModel < Cms::Models::Document
  include Uploadable
  
end

describe Uploadable do
  pending 'todo'
end
