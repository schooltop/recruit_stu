class WrittenApply < ApplicationRecord
  belongs_to :student
  scope :record_by_apply_set_id, -> id {where(apply_set_id: id)}
end