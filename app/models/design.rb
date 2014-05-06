class Design < ActiveRecord::Base
  has_attached_file :renders, :styles => {
      :medium => '290x500>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :renders, :content_type => /\Aimage\/.*\Z/
end
