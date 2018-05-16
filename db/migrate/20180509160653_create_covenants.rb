class CreateCovenants < ActiveRecord::Migration[5.1]
  def change
    create_table :covenants do |t|
      t.string :urlMultimedia
      t.references :discipleship, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
