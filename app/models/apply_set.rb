class ApplySet < ApplicationRecord
  has_many :student_classes
  has_many :written_applies
  scope :show_records, -> {where(status:1)}
  enum status: {
    "关闭": 0,
    "开启": 1
  }
end