class CreateSolicits < ActiveRecord::Migration[5.1]
  def change
    create_table :solicits do |t|
      t.references :user, foreign_key: true
      t.references :discipleship, foreign_key: true

      t.timestamps
    end
  end
end
