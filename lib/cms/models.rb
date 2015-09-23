require 'rubygems'
require "active_support/all"
require 'mongoid'
require 'mongoid-history'
require 'byebug'
require 'mongoid_orderable'
require "cms/models/history_tracker"
require "cms/models/version"
require "cms/models/concerns/document"
require "cms/models/document"
require "cms/models/concerns/blueprintable"
require "cms/models/proto_type_builder"
require "cms/models/concerns/categorizable"
require "cms/models/concerns/composite"
require "cms/models/concerns/listable"

module Cms
  module Models
    def self.version_string
      "Cms version #{Cms::Models::VERSION}"
    end
  end
end
