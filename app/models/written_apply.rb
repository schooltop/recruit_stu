class WrittenApply < ApplicationRecord
  belongs_to :student
  belongs_to :apply_set
  scope :record_by_apply_set_id, -> id {where(apply_set_id: id)}
end