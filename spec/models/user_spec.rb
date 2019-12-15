require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:tipoDocumento) }

  describe "#validar_rol_de_usuario" do
  	#se crea un objeto osuario, con parametros por defecto, establecidos en FactoryGirl
  	#es decir, crea usuarios con atributos estaticos par correo y contrasena
  	let(:user){FactoryGirl.build(:user)}
  	it "deberia ser estudiante" do
  		expect(user.valid?).to be_falsy
  	end
  end
end
