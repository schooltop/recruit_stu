class Attachment < ApplicationRecord
  belongs_to :attachment_entity, polymorphic: true


  mount_uploader :path,  AttachmentUploader
  before_save :set_fields

  def set_fields
    self.content_type = path.content_type
    self.file_size = path.size
    self.name = path.get_original_filename
  end

  def attachment_path
    path.url
  end

end
