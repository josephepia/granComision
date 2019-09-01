class CreatePreviousChurches < ActiveRecord::Migration[5.1]
  def change
    create_table :previous_churches do |t|
      t.string :nombre
      t.string :tiempo
      t.references :address, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
