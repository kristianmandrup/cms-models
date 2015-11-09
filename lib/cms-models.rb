require 'application'

Mongoid::History.tracker_class_name = 'Cms::Models::HistoryTracker'

module Cms
  extend ActiveSupport::Autoload

  autoload :Uploaders
  autoload :Validators
end
require 'cms/models'
