class CreateFailures < ActiveRecord::Migration[5.1]
  def change
    create_table :failures do |t|
      t.datetime :fecha
      t.references :enroll, foreign_key: true
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
