class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :direccion
      t.string :nombreBarrio
      t.references :user, foreign_key: true
      t.references :district, foreign_key: true

      t.timestamps
    end
  end
end
