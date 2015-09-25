require 'rubygems'
require "active_support/all"
require 'mongoid'
require 'mongoid-history'
require 'byebug'
require 'mongoid_orderable'
require 'workflow'

require "cms/models/history_tracker"
require "cms/models/version"
require "cms/concerns/documentable"
require "cms/models/document"
require "cms/concerns/blueprintable"
require "cms/models/proto_type_builder"
require "cms/concerns/categorizable"
require "cms/concerns/composite"
require "cms/concerns/listable"
require "cms/concerns/extendable"
require "cms/models/attribute/generic"
require "cms/concerns/localize"
require "cms/concerns/meta_info"
require "cms/concerns/describable"
require "cms/concerns/taggable"
require "cms/concerns/named"
require "cms/concerns/publishable"
require "cms/concerns/workflowable"

module Cms
  module Models
    def self.version_string
      "Cms version #{Cms::Models::VERSION}"
    end
  end
end
