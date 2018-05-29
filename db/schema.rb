# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180514155226) do

  create_table "address_church_and_document_expeditions", force: :cascade do |t|
    t.string "nombreIglesiaAnterior"
    t.boolean "iglesia", default: false
    t.boolean "expedicion", default: false
    t.boolean "origen", default: false
    t.integer "user_id"
    t.integer "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_address_church_and_document_expeditions_on_city_id"
    t.index ["user_id"], name: "index_address_church_and_document_expeditions_on_user_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.string "direccion"
    t.string "nombreBarrio"
    t.integer "user_id"
    t.integer "district_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["district_id"], name: "index_addresses_on_district_id"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "administrators", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_administrators_on_user_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "nombre"
    t.integer "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_cities_on_department_id"
  end

  create_table "commentaries", force: :cascade do |t|
    t.text "cuerpo"
    t.integer "publication_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publication_id"], name: "index_commentaries_on_publication_id"
    t.index ["user_id"], name: "index_commentaries_on_user_id"
  end

  create_table "community_groups", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "covenants", force: :cascade do |t|
    t.string "urlMultimedia"
    t.integer "discipleship_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discipleship_id"], name: "index_covenants_on_discipleship_id"
    t.index ["student_id"], name: "index_covenants_on_student_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "nombre"
    t.integer "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_departments_on_country_id"
  end

  create_table "discipleships", force: :cascade do |t|
    t.string "nombre"
    t.string "rangoOtorgado"
    t.string "descripcion"
    t.string "descripcionPacto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "districts", force: :cascade do |t|
    t.string "nombre"
    t.integer "comuna"
    t.integer "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_districts_on_city_id"
  end

  create_table "enrolls", force: :cascade do |t|
    t.string "definitiva"
    t.integer "discipleship_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discipleship_id"], name: "index_enrolls_on_discipleship_id"
    t.index ["student_id"], name: "index_enrolls_on_student_id"
  end

  create_table "extended_notes", force: :cascade do |t|
    t.string "definitiva", default: "sin calificar"
    t.date "fecha"
    t.string "idGrupo"
    t.integer "discipleship_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discipleship_id"], name: "index_extended_notes_on_discipleship_id"
    t.index ["student_id"], name: "index_extended_notes_on_student_id"
  end

  create_table "failures", force: :cascade do |t|
    t.datetime "fecha"
    t.integer "enroll_id"
    t.integer "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enroll_id"], name: "index_failures_on_enroll_id"
    t.index ["lesson_id"], name: "index_failures_on_lesson_id"
  end

  create_table "given_courses", force: :cascade do |t|
    t.string "idGrupo"
    t.date "fechaInicio"
    t.date "fechaCierre"
    t.integer "discipleship_id"
    t.integer "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discipleship_id"], name: "index_given_courses_on_discipleship_id"
    t.index ["teacher_id"], name: "index_given_courses_on_teacher_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "nombre"
    t.boolean "activo"
    t.integer "discipleship_id"
    t.integer "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discipleship_id"], name: "index_groups_on_discipleship_id"
    t.index ["teacher_id"], name: "index_groups_on_teacher_id"
  end

  create_table "horaries", force: :cascade do |t|
    t.string "lunesInicio"
    t.string "lunesFinal"
    t.string "martesInicio"
    t.string "martesFinal"
    t.string "miercolesInicio"
    t.string "miercolesFinal"
    t.string "juevesInicio"
    t.string "juevesFinal"
    t.string "viernesInicio"
    t.string "viernesFinal"
    t.string "sabadoInicio"
    t.string "sabadoFinal"
    t.string "domingoInicio"
    t.string "domingoFinal"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_horaries_on_group_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "nombre"
    t.text "descripcion"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_lessons_on_group_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "urlMaterial"
    t.string "formato"
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ministeries", force: :cascade do |t|
    t.string "nombre"
    t.text "informacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publications", force: :cascade do |t|
    t.text "descripcion"
    t.integer "material_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_publications_on_group_id"
    t.index ["material_id"], name: "index_publications_on_material_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "rango"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_teachers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "tipoDocumento"
    t.string "identificacion", null: false
    t.string "primerNombre"
    t.string "segundoNombre", default: ""
    t.string "primerApellido"
    t.string "segundoApellido"
    t.string "telefono"
    t.string "sexo"
    t.date "fechaNacimiento"
    t.date "fechaRegistro"
    t.string "estadoCivil"
    t.date "fechaAniversario"
    t.string "primerNombreConyuge"
    t.string "segundoNombreConyuge", default: ""
    t.string "primerApellidoConyuge"
    t.string "segundoApellidoConyuge"
    t.string "confesionReligiosa"
    t.boolean "fueMiembroOtraIglesia"
    t.string "tiempoOtraIglesia"
    t.string "nivelAcademico"
    t.string "profesionOficio"
    t.boolean "confirmado", default: false
    t.boolean "activo", default: true
    t.boolean "suspendido", default: false
    t.boolean "liderComunitario", default: false
    t.integer "community_group_id"
    t.integer "ministery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_group_id"], name: "index_users_on_community_group_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["identificacion"], name: "index_users_on_identificacion", unique: true
    t.index ["ministery_id"], name: "index_users_on_ministery_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
