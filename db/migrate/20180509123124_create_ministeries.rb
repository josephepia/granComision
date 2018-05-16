class CreateMinisteries < ActiveRecord::Migration[5.1]
  def change
    create_table :ministeries do |t|
      t.string :nombre
      t.text :informacion

      t.timestamps
    end
  end
end
