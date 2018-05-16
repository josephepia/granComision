class CreateDepartments < ActiveRecord::Migration[5.1]
  def change
    create_table :departments do |t|
      t.string :nombre
      t.references :country, foreign_key: true

      t.timestamps
    end
  end
end
