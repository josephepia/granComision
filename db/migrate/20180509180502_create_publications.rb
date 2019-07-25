class CreatePublications < ActiveRecord::Migration[5.1]
  def change
    create_table :publications do |t|
      t.string :imagen
      t.string :multimedia
      t.text :descripcion
      t.text :titulo
      t.references :material, foreign_key: true
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
