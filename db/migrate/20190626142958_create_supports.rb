class CreateSupports < ActiveRecord::Migration[5.1]
  def change
    create_table :supports do |t|
      t.string :urlMultimedia
      t.references :user, foreign_key: true
      t.references :covenant, foreign_key: true

      t.timestamps
    end
  end
end
