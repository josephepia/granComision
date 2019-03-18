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

ActiveRecord::Schema.define(version: 20190318042113) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "address_church_and_document_expeditions", force: :cascade do |t|
    t.string "nombreIglesiaAnterior"
    t.boolean "iglesia", default: false
    t.boolean "expedicion", default: false
    t.boolean "origen", default: false
    t.bigint "user_id"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_address_church_and_document_expeditions_on_city_id"
    t.index ["user_id"], name: "index_address_church_and_document_expeditions_on_user_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.string "direccion"
    t.string "nombreBarrio"
    t.bigint "user_id"
    t.bigint "district_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["district_id"], name: "index_addresses_on_district_id"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "nombre"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_cities_on_department_id"
  end

  create_table "commentaries", force: :cascade do |t|
    t.text "cuerpo"
    t.bigint "publication_id"
    t.bigint "user_id"
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
    t.string "pdf"
    t.bigint "discipleship_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discipleship_id"], name: "index_covenants_on_discipleship_id"
  end

  create_table "covenants_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "covenant_id", null: false
    t.index ["covenant_id"], name: "index_covenants_users_on_covenant_id"
    t.index ["user_id"], name: "index_covenants_users_on_user_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "nombre"
    t.bigint "country_id"
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
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_districts_on_city_id"
  end

  create_table "enrolls", force: :cascade do |t|
    t.string "definitiva", default: "sin definir"
    t.bigint "group_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_enrolls_on_group_id"
    t.index ["user_id"], name: "index_enrolls_on_user_id"
  end

  create_table "extended_notes", force: :cascade do |t|
    t.string "definitiva"
    t.date "fecha"
    t.string "idGrupo"
    t.bigint "discipleship_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discipleship_id"], name: "index_extended_notes_on_discipleship_id"
    t.index ["user_id"], name: "index_extended_notes_on_user_id"
  end

  create_table "failures", force: :cascade do |t|
    t.datetime "fecha"
    t.boolean "asistio"
    t.bigint "enroll_id"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enroll_id"], name: "index_failures_on_enroll_id"
    t.index ["group_id"], name: "index_failures_on_group_id"
  end

  create_table "given_courses", force: :cascade do |t|
    t.string "idGrupo"
    t.date "fechaInicio"
    t.date "fechaCierre"
    t.bigint "discipleship_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discipleship_id"], name: "index_given_courses_on_discipleship_id"
    t.index ["user_id"], name: "index_given_courses_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "nombre"
    t.boolean "activo", default: false
    t.bigint "discipleship_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discipleship_id"], name: "index_groups_on_discipleship_id"
    t.index ["user_id"], name: "index_groups_on_user_id"
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
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_horaries_on_group_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "nombre"
    t.text "descripcion"
    t.bigint "discipleship_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discipleship_id"], name: "index_lessons_on_discipleship_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "pdf"
    t.string "imagen"
    t.string "descripcion"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_materials_on_user_id"
  end

  create_table "ministeries", force: :cascade do |t|
    t.string "nombre"
    t.text "informacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permissions_users", force: :cascade do |t|
    t.bigint "permission_id"
    t.bigint "user_id"
    t.index ["permission_id"], name: "index_permissions_users_on_permission_id"
    t.index ["user_id"], name: "index_permissions_users_on_user_id"
  end

  create_table "publications", force: :cascade do |t|
    t.string "pdf"
    t.string "imagen"
    t.text "descripcion"
    t.bigint "material_id"
    t.bigint "group_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_publications_on_group_id"
    t.index ["material_id"], name: "index_publications_on_material_id"
    t.index ["user_id"], name: "index_publications_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.bigint "role_id"
    t.bigint "user_id"
    t.index ["role_id"], name: "index_roles_users_on_role_id"
    t.index ["user_id"], name: "index_roles_users_on_user_id"
  end

  create_table "solicits", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "discipleship_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discipleship_id"], name: "index_solicits_on_discipleship_id"
    t.index ["user_id"], name: "index_solicits_on_user_id"
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
    t.string "rango"
    t.bigint "community_group_id"
    t.bigint "ministery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_group_id"], name: "index_users_on_community_group_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["identificacion"], name: "index_users_on_identificacion", unique: true
    t.index ["ministery_id"], name: "index_users_on_ministery_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "address_church_and_document_expeditions", "cities"
  add_foreign_key "address_church_and_document_expeditions", "users"
  add_foreign_key "addresses", "districts"
  add_foreign_key "addresses", "users"
  add_foreign_key "cities", "departments"
  add_foreign_key "commentaries", "publications"
  add_foreign_key "commentaries", "users"
  add_foreign_key "covenants", "discipleships"
  add_foreign_key "departments", "countries"
  add_foreign_key "districts", "cities"
  add_foreign_key "enrolls", "groups"
  add_foreign_key "enrolls", "users"
  add_foreign_key "extended_notes", "discipleships"
  add_foreign_key "extended_notes", "users"
  add_foreign_key "failures", "enrolls"
  add_foreign_key "failures", "groups"
  add_foreign_key "given_courses", "discipleships"
  add_foreign_key "given_courses", "users"
  add_foreign_key "groups", "discipleships"
  add_foreign_key "groups", "users"
  add_foreign_key "horaries", "groups"
  add_foreign_key "lessons", "discipleships"
  add_foreign_key "materials", "users"
  add_foreign_key "permissions_users", "permissions"
  add_foreign_key "permissions_users", "users"
  add_foreign_key "publications", "groups"
  add_foreign_key "publications", "materials"
  add_foreign_key "publications", "users"
  add_foreign_key "solicits", "discipleships"
  add_foreign_key "solicits", "users"
  add_foreign_key "users", "community_groups"
  add_foreign_key "users", "ministeries"
end
