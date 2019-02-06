class CreatePermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :permissions do |t|
    	t.string	:nombre
      t.timestamps
    end
  end
end
