class CreateHoraries < ActiveRecord::Migration[5.1]
  def change
    create_table :horaries do |t|
      t.string :lunesInicio
      t.string :lunesFinal
      t.string :martesInicio
      t.string :martesFinal
      t.string :miercolesInicio
      t.string :miercolesFinal      
      t.string :juevesInicio
      t.string :juevesFinal      
      t.string :viernesInicio
      t.string :viernesFinal
      t.string :sabadoInicio
      t.string :sabadoFinal      
      t.string :domingoInicio
      t.string :domingoFinal      
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
