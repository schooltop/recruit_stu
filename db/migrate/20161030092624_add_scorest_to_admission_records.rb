class AddScorestToAdmissionRecords < ActiveRecord::Migration[5.0]
  def change
    add_column :admission_records, :interview_score, :float
    add_column :admission_records, :written_score, :float
  end
end
