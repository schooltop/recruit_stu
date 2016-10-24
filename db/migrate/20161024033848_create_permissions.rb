class CreatePermissions < ActiveRecord::Migration[5.0]
  def change
    create_table :permissions do |t|
      t.string    :name
      t.string    :action_tag
      t.string    :function_tag
      t.timestamps
    end
  end
end
