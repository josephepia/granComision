class CreateMaterials < ActiveRecord::Migration[5.1]
  def change
    create_table :materials do |t|
      t.string :urlMaterial
      t.string :formato
      t.string :descripcion

      t.timestamps
    end
  end
end
