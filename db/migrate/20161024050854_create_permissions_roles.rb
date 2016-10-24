class CreatePermissionsRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :permissions_roles do |t|
      t.references :permission
      t.references :user
    end
  end
end
