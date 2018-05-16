class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :nombre
      t.boolean :activo
      t.references :discipleship, foreign_key: true
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end
