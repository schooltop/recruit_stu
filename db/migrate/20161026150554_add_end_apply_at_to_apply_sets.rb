class AddEndApplyAtToApplySets < ActiveRecord::Migration[5.0]
  def change
    add_column :apply_sets, :end_apply_at, :datetime
  end
end
