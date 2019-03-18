class CreateMaterials < ActiveRecord::Migration[5.1]
  def change
    create_table :materials do |t|
      t.string :pdf
      t.string :imagen
      t.string :descripcion
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
