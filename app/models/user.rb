class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:identificacion]
  # validaciones de integridad referencial        
  has_and_belongs_to_many :ministeries
  has_and_belongs_to_many :roles
  has_and_belongs_to_many :permissions
  has_many :addresses
  has_many :groups
  has_many :given_courses #, :through => :teacher
  has_many :covenants #, :through => :student
  has_many :horaries, :through => :groups
  has_many :enrolls
  has_many :failures, :through => :enroll
  has_many :extended_notes #, :through => :student
  has_many :previous_church
  belongs_to :communitygroups,optional: true
  has_and_belongs_to_many :covenants
  #fin de validaciones de integridad referencial 
  #validaciones
    #validacion de presencia
    validates :email,:tipoDocumento,:identificacion,:primerNombre,:primerApellido,:sexo,:fechaNacimiento,:estadoCivil,:confesionReligiosa,:nivelAcademico,:profesionOficio,:telefono, presence: true
    #validacion valores entre un rago o tamano
    validates :fueMiembroOtraIglesia,:bautizadoAdulto, inclusion: { in: [true, false] }
    validates :sexo, inclusion: { in: ['masculino', 'femenino'] }
    validates :nivelAcademico, inclusion: { in: ['primaria','secundaria','tecnico','tecnologo','universitario','postgrado'] }

    validates :primerNombre,    length: { in: 2..30 }
    validates :primerApellido,  length: { in: 2..30 }
    validates :identificacion,  length: { in: 6..11 }
    validates :email,           length: { in: 10..20 }

    validates :telefono,        length: { is: 10}

    #validacion de campos numericos
    validates :identificacion, numericality: true
    validates :telefono, numericality: true
    
  #validacion personalizada
  validate :validar_correo_regex

  #------------------todos los atributos del modelo ----
  # validates: :identificacion
  # validates: :primerNombre
  # validates: :segundoNombre
  # validates: :primerApellido
  # validates: :segundoApellido
  # validates: :telefono
  # validates: :sexo
  # validates: :fechaNacimiento
  # validates: :fechaRegistro
  # validates: :estadoCivil
  # validates: :fechaAniversario
  # validates: :primerNombreConyuge
  # validates: :segundoNombreConyuge
  # validates: :primerApellidoConyuge
  # validates: :segundoApellidoConyuge
  # validates: :confesionReligiosa
  # validates: :fueMiembroOtraIglesia
  # validates: :nivelAcademico
  # validates: :profesionOficio
  # validates: :confirmado
  # validates: :activo
  # validates: :suspendido
  # validates: :liderComunitario
  # validates: :rango
  # validates: :nuevoCreyente
  # validates: :bautizadoAdulto
  # validates: :fechaBautizo
  # validates: :community_group_id
  # validates: :ministery_id
  # -------------------fin de atributos del modelo ---------
  #fin validaciones


  def email_required?
    false
  end
  def email_changed?
    false
  end

  # use this instead of email_changed? for rails >= 5.1
  def will_save_change_to_email?
    false
  end

  def nombre_completo
    "#{primerNombre} #{segundoNombre} #{primerApellido} #{segundoApellido}".titleize
  end

  def apellidos
    "#{primerApellido} #{segundoApellido}"
  end

  def nombres
    "#{primerNombre} #{segundoNombre}"
  end
  def nombre_asistencia
    "#{primerApellido} #{segundoApellido} #{primerNombre} #{segundoNombre}".titleize

  end

  def is_student
    if self.roles.where(nombre: 'estudiante')
      return true
    else
      return false
    end
  end



  def is_teacher
    self.roles.exists?(nombre: 'docente')
  end
  def esEstudiante
    self.roles.exists?(nombre: 'estudiante')
  end
  def esAdministrador
    self.roles.exists?(nombre: 'administrador')
  end


  def is_enrolled
     Enroll.exists?(user_id: self.id)
  end

  def enrolled_in_discipleship(discipleship_id)

    Enroll.where(student_id: self.student.id).all.each do |grupo|
      if (Group.find(grupo.group_id)).discipleship.id == discipleship_id
        return true
      end
    end
    return false
  end

  private
    def validar_correo_regex
      unless email =~ /^[^@]+@[^@]+\.[a-zA-Z]{2,}$/
        errors.add(:email, "el correo debe ser alfanumerico@alfanumerico.alfanumerico")
      end
      
    end


end
