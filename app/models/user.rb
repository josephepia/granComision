class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:identificacion]
  has_and_belongs_to_many :ministeries
  has_one :teacher
  has_one :student
  has_many :addresschurchanddocumentexpeditions
  has_many :address
  has_many :groups, :through => :teacher
  has_many :given_courses, :through => :teacher
  has_many :covenants, :through => :student
  has_one  :enrroll, :through => :student
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
end
