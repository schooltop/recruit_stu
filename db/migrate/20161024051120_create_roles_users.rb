class CreateRolesUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :roles_users do |t|
      t.references :role
      t.references :user
    end
  end
end
