class CreateDiscipleships < ActiveRecord::Migration[5.1]
  def change
    create_table :discipleships do |t|
      t.string :nombre
      t.string :rangoOtorgado
      t.string :descripcion
      t.string :descripcionPacto

      t.timestamps
    end
  end
end
