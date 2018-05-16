class CreateHoraries < ActiveRecord::Migration[5.1]
  def change
    create_table :horaries do |t|
      t.string :lunes
      t.string :martes
      t.string :miercoles
      t.string :jueves
      t.string :viernes
      t.string :sabado
      t.string :domingo
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
