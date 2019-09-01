class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string  :tipo
      t.string :descripcion
      t.references :user, foreign_key: true
      t.references :district, foreign_key: true
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
