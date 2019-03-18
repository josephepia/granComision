class CreateExtendedNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :extended_notes do |t|
      t.string :definitiva
      t.date :fecha
      t.string :idGrupo
      t.references :discipleship, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
