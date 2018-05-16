class CreateGivenCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :given_courses do |t|
      t.string :idGrupo
      t.date :fechaInicio
      t.date :fechaCierre
      t.references :discipleship, foreign_key: true
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end
