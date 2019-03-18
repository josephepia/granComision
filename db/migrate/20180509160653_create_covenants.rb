class CreateCovenants < ActiveRecord::Migration[5.1]
  def change
    create_table :covenants do |t|
      t.string :pdf
      t.references :discipleship, foreign_key: true
      
      t.timestamps
    end
  end
end
