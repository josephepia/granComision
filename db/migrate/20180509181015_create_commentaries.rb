class CreateCommentaries < ActiveRecord::Migration[5.1]
  def change
    create_table :commentaries do |t|
      t.text :descripcion
      t.references :publication, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
