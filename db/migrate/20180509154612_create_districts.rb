class CreateDistricts < ActiveRecord::Migration[5.1]
  def change
    create_table :districts do |t|
      t.string :nombre
      t.integer :comuna
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
