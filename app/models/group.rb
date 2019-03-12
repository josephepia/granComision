class Group < ApplicationRecord
  belongs_to :discipleship
  belongs_to :user,optional: true
  has_one :horary, dependent: :destroy
  has_many :failures, dependent: :destroy
  has_many :enrolls, dependent: :destroy
  has_many :publications, dependent: :destroy

  def id_nombre_docente
  	
  	"#{self.id} #{self.user.nombre_completo}"
  end
end
