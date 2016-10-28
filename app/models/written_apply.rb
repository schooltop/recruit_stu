class WrittenApply < ApplicationRecord
  belongs_to :student
  belongs_to :apply_set
  #validates_uniqueness_of :student_id, :message => "已存在申请记录"
  scope :record_by_apply_set_id, -> id {where(apply_set_id: id)}
end