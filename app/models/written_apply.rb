class WrittenApply < ApplicationRecord
  belongs_to :student
  belongs_to :apply_set
  enum status: {
    "待审核": 0,
    "通过": 1,
    "不通过": 2
  }
  #validates_uniqueness_of :student_id, :message => "已存在申请记录"
  scope :record_by_apply_set_id, -> id {where(apply_set_id: id)}
end