class Group < ApplicationRecord
  belongs_to :discipleship
  belongs_to :user,optional: true
  has_one :horary
  has_many :sessions
  has_many :enrolls
  has_many :publications

  def id_nombre_docente
  	
  	"#{self.id} #{self.user.nombre_completo}"
  end
end
