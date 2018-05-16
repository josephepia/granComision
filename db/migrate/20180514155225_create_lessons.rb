class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.string :nombre
      t.text :descripcion
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
