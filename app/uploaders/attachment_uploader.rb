# encoding: utf-8

class AttachmentUploader < CarrierWave::Uploader::Base
  include CarrierWave::MimeTypes

  process :set_content_type

  def store_dir
    "#{Rails.root}/public/" + "uploads/#{model.class.to_s.underscore}"
  end

  def extension_white_list
    #%w(jpg jpeg gif png pdf xls xlsx)
  end

  def filename
    @_filename ||= begin
    name = SecureRandom.uuid.to_s.strip
    extension = original_filename.to_s.strip.scan(/\.([^\.]+)$/).flatten.first.to_s.strip
    if extension.present?
      name = "#{name}.#{extension}"
    end
    name
    end
  end

  def get_original_filename
    original_filename.to_s
  end

end
