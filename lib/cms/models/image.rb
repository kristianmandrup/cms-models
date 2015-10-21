class Cms::Models::Image < Cms::Models::Document
  include ContentItem
  include Templates
  include Listable
  include Uploadable
  
  field :title, type: String
  field :content, type: String
  field :summary, type: String
  field :mime_type, type: String

  belongs_to :imageable, polymorphic: true
  
  #belongs_to :named_image, class_name: 'Cms::Models::Named::Image', inverse_of: :image
  #belongs_to :image_list, class_name: 'Cms::Models::Image::List', inverse_of: :images

  metadata_fields keywords: Array, author: String
  
  fields_validation
  localize_fields :title, :description 
  
  tracks :name
  
  def blueprint_attributes
    nil
  end
  
  def serializable_attributes
    [:name, :mime_type]
  end

  alias_method :url, :img_content_url
  
  
end
