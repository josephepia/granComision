class CreatePublications < ActiveRecord::Migration[5.1]
  def change
    create_table :publications do |t|
      t.text :descripcion
      t.references :material, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
