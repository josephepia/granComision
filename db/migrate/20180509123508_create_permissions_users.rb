class CreatePermissionsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :permissions_users do |t|
      t.references :permission, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
