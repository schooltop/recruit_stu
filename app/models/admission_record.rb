class AdmissionRecord < ApplicationRecord
  belongs_to :student
  enum status: {
    "通过": 1,
    "不通过": 0
  }
end