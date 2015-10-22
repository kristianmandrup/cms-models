# A convenience class for creating Components that are (root) pages
class Cms::Models::Page
  def self.create opts = {}
    Cms::Models::Component.create(opts.merge(page: true))
  end

  def self.find opts = {}
    Cms::Models::Component.find_by(opts.merge(page: true))
  end
end
