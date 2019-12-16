require 'rails_helper'

RSpec.describe Discipleship, type: :model do
  describe 'validaciones del modelo' do
		#campos obligatorios
		 
	  it { should validate_presence_of(:nombre) }
	  it { should validate_presence_of(:rangoOtorgado) }
	  it { should validate_presence_of(:descripcion) }
	  it { should validate_presence_of(:descripcionPacto) }



	  #campos con valores en un rango o tamanos
	  it { should validate_length_of(:nombre).is_at_least(5).is_at_most(15) }
	  it { should validate_length_of(:rangoOtorgado).is_at_least(5).is_at_most(15) }
	  it { should validate_length_of(:descripcion).is_at_least(5).is_at_most(50) }
	  it { should validate_length_of(:descripcionPacto).is_at_least(5).is_at_most(50) }

	end
	
	describe 'test nombre' do
		
		it 'el  nombre no debe ser menor a 5 caracteres' do
			user = Discipleship.new(nombre: "J")
			user.save
			expect = user.errors[:nombre];
			actual = ["is too short (minimum is 5 characters)"]
			expect(actual).to eql(expect)
		end
		it 'el  nombre no debe ser mayor a 15 caracteres' do
			user = Discipleship.new(nombre: "primeros pasos para entender la vida cristiana")
			user.save
			expect = user.errors[:nombre];
			actual = ["is too long (maximum is 15 characters)"]
			expect(actual).to eql(expect)
		end
		it 'el nombre no debe ser nulo' do
			user = Discipleship.new(nombre: "")
			expect = user.errors[:nombre];
			actual = ["can't be blank", "is too short (minimum is 5 characters)"]
			user.save
			expect(actual).to eql(expect)
		end

		it 'nombre correcto' do
			user = Discipleship.new(nombre: "discipulado 1")
			user.save
			expect(user.errors[:nombre]).to be_empty
		end

		it 'prueba' do
			x = true
			expect(x).to eq(true)
		end
	end

	
end
