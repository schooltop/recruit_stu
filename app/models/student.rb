class Student < ApplicationRecord
  has_one :interview_score
  has_one :written_score
  has_one :written_apply
  has_one :admission_record
end