# A convenience class for creating Components that are (root) pages
class Cms::Models::Page
  def create opts = {}
    Component.new(opts.merge(type: 'page'))
  end

  def find opts = {}
    Component.find_by(opts.merge(type: 'page'))
  end
end
