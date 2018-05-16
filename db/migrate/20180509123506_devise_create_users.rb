class DeviseCreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      t.string   :tipoDocumento
      t.string    :identificacion, null: false
      t.string    :primerNombre
      t.string    :segundoNombre, default: ""
      t.string    :primerApellido
      t.string    :segundoApellido
      t.string    :telefono
      t.string    :sexo
      t.date      :fechaNacimiento
      t.date      :fechaRegistro
      t.string    :estadoCivil
      t.date      :fechaAniversario
      t.string    :primerNombreConyuge
      t.string    :segundoNombreConyuge,default: ""     
      t.string    :primerApellidoConyuge
      t.string    :segundoApellidoConyuge
      t.string    :confesionReligiosa
      t.boolean   :fueMiembroOtraIglesia
      t.string   :tiempoOtraIglesia
      t.string    :nivelAcademico
      t.string    :profesionOficio
      t.boolean   :confirmado, default: false
      t.boolean   :activo, default: true
      t.boolean   :suspendido, default: false
      t.boolean   :liderComunitario, default: false



      t.references :community_group, foreign_key: true
      t.references :ministery, foreign_key: true

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end
    add_index :users, :identificacion,       unique: true    
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
