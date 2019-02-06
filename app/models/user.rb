class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:identificacion]
  has_and_belongs_to_many :ministeries
  has_and_belongs_to_many :roles
  has_and_belongs_to_many :permissions
  has_many :addresschurchanddocumentexpeditions
  has_many :address
  has_many :groups
  has_many :given_courses, :through => :teacher
  has_many :covenants, :through => :student
  has_many  :enrrolls
  has_many :extended_notes, :through => :student
  belongs_to :communitygroups,optional: true
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
    "#{primerNombre} #{primerApellido}"
  end

  def is_student
    if User.joins(:roles).where(roles: 'estudiante')
      return true
    else
      return false
    end
  end

  def is_teacher
    if User.joins(:roles).where(roles: 'docente')
      return true
    else
      return false
    end
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
  
  
  
  
end
