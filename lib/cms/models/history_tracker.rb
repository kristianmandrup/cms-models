module Cms
  module Models
    class HistoryTracker
      include Mongoid::History::Tracker
    end
  end
end
