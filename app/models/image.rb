class Image < ActiveRecord::Base
  # Generate a 100x100 cropped fixed-ratio thumbnail and a max 300x300 medium preview alongside original image
  has_attached_file :payload, :default_url => "/images/:style/missing.png", :styles => {
      :medium => '300x300>',
      :thumb => '100x100#'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end