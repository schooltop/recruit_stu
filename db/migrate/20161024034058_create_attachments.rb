class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.string   "path", comment: '附件文件名'
      t.string   "name", comment: '附件原文件名'
      t.string   "file_size", comment: '附件大小'
      t.string   "content_type", comment: '附件后缀名'
      t.string   "attachment_type", comment: '关联模块'
      t.integer  "attachment_id", comment: '关联模块ID'
      t.integer  "upload_by", comment: '上传人'
      t.string   "column_name", comment: '拓展字断'
      t.timestamps
    end
  end
end