module Uploadable
  extend ActiveSupport::Concern

  included do
    # We need not to create any field as Carrierwave will automatically create
    # it for us.
    mount_uploader :img_content, Cms::Uploaders::ImageUploader
    #process_in_background :img_content
    validates :img_content, presence: true
  end
end
