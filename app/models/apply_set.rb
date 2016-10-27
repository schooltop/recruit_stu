class ApplySet < ApplicationRecord
  has_many :student_classes
  scope :show_records, -> {where(status:1)}
end