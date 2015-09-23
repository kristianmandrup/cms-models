require 'rubygems'
require "cms/models/version"
require "cms/models/concerns/document"
require "active_support/all"
require 'mongoid'
require 'mongoid-history'
require 'byebug'
require "cms/models/history_tracker"
module Cms
  module Models
    def self.version_string
      "Cms version #{Cms::Models::VERSION}"
    end
  end
end
