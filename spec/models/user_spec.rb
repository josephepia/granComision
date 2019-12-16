require 'rails_helper'
# tipos de pruebas que se pueden realizar con la gema Should

# Pruebas de enrutamiento
# Pruebas de control
# Pruebas de modelo
# Pruebas de características
# Ver pruebas
# Pruebas de correo

RSpec.describe User, type: :model do
	# User.validators
	# comprueba si la validacion existe en el modelo.
	describe 'validaciones del modelo' do
		#campos obligatorios
		it { should validate_presence_of(:tipoDocumento) }
	  it { should validate_presence_of(:identificacion) }
	  it { should validate_presence_of(:primerNombre) }
	  it { should validate_presence_of(:primerApellido) }
	  it { should validate_presence_of(:sexo) }
	  it { should validate_presence_of(:fechaNacimiento) }
	  it { should validate_presence_of(:estadoCivil) }
	  it { should validate_presence_of(:confesionReligiosa) }
	  it { should validate_presence_of(:nivelAcademico) }
	  it { should validate_presence_of(:profesionOficio) }
	  it { should validate_presence_of(:email) }


	  #campos numericos
	  it { should validate_numericality_of(:identificacion) }

	  #campos con valores en un rango o tamanos
	  it { should validate_length_of(:identificacion).is_at_least(6).is_at_most(11) }
	  it { should validate_length_of(:primerNombre).is_at_least(2).is_at_most(30) }
	  it { should validate_length_of(:primerApellido).is_at_least(2).is_at_most(30) }
	  it { should validate_length_of(:email).is_at_least(10).is_at_most(20) }
	  it { should validate_length_of(:telefono).is_equal_to(10) }
	  it { should_not allow_value(nil).for(:fueMiembroOtraIglesia) }
		it { should_not allow_value(nil).for(:bautizadoAdulto) }
	  it { should validate_inclusion_of(:sexo).in_array(['masculino', 'femenino']) }
	  it { should validate_inclusion_of(:nivelAcademico).in_array(['primaria','secundaria','tecnico','tecnologo','universitario','postgrado']) }

	  #validacion para expresion regular
	  #-> expresion regular usada por la gema devise para el  correo -> /^[^@]+@[^@]+\.[a-zA-Z]{2,}$/
	  it { should allow_value('correo@gmail.com').for(:email) }

	end
	
	#pruebas unitarias para instancias creadas
	#prueba unitaria para el correo
	describe "#validar_correo_regex" do 
		it 'no deberia permitir correos con tamano menor a 10' do
			user = User.new(email: "abc@a.co")
			user.save

			#espero que el usuario ingresado sea incorrecto
			expect(user.errors[:email]).to include("is too short (minimum is 10 characters)")
		end
		it 'no deberia permitir correos con tamano mayor a 20' do
			user = User.new(email: "abcdddddddddddddddddddddddd@a.co")
			user.save
			
			#espero que el usuario ingresado sea incorrecto
			expect(user.errors[:email]).to include("is too long (maximum is 20 characters)")
			
			
		end
		it 'deberia permitir correos con formato valido' do
			user = User.new(email: "correo@gmail.com")
			user.save
			#espero que el usuario ingresado sea correcto
			expect(user.errors[:email]).to be_empty
			
		end
	end

	describe 'prueba para registro de usuario' do
		#molde para crear instancia de usuario completa
		#user = User.new(email: "correo@gmail.com", password: "123456", tipoDocumento: "cc",identificacion: "1234567890",primerNombre: "primer nombre",primerApellido: "primer apellido",sexo: "masculino",fechaNacimiento: "10/10/10",estadoCivil: "soltero",confesionReligiosa: "catolico",nivelAcademico: "secundaria",profesionOficio: "ninguno",fueMiembroOtraIglesia: true,bautizadoAdulto: true,telefono: "12345")
		it 'todos los campos deberian estar correctos' do
			user = User.new(email: "correo@gmail.com", password: "123456", tipoDocumento: "cc",identificacion: "1234567890",primerNombre: "primer nombre",primerApellido: "primer apellido",sexo: "masculino",fechaNacimiento: "10/10/10",estadoCivil: "soltero",confesionReligiosa: "catolico",nivelAcademico: "secundaria",profesionOficio: "ninguno",fueMiembroOtraIglesia: true,bautizadoAdulto: true,telefono: "1234567891")
			user.save
			expect(user.errors).to be_empty
		end

	end

	describe 'prueba para la identificacion' do
		
		it 'la identificacion no debe ser menor de 6 digitos' do
			user = User.new(identificacion: "12")
			user.save
	
 			expect(user.errors[:identificacion]).to include("is too short (minimum is 6 characters)")
		end
		it 'la identificacion no debe ser mayor de 11 digitos' do
			user = User.new(identificacion: "123456789011")
			user.save
			expect(user.errors[:identificacion]).to include("is too long (maximum is 11 characters)")
		end
		it 'la identificacion no debe ser nula' do
			user = User.new(identificacion: nil)
			user.save
			expect(user.errors[:identificacion]).to include("can't be blank")
		end
		it 'la identificacion no es nula y cumple con el tamaño esperado' do
			user = User.new(identificacion: "1234567890")
			user.save
			expect(user.errors[:identificacion]).to be_empty
		end
	end
	
	describe 'prueba para el primer nombre' do
		
		it 'el primer nombre no debe ser menor a 2 caracteres' do
			user = User.new(primerNombre: "J")
			user.save
			expect(user.errors[:primerNombre]).to include("is too short (minimum is 2 characters)")
		end
		it 'el primer nombre no debe ser mayor a 30 caracteres' do
			user = User.new(primerNombre: "Joseph Epiayu Fernandez Solano Perez")
			user.save
			expect(user.errors[:primerNombre]).to include("is too long (maximum is 30 characters)")
		end
		it 'el primer nombre no debe ser nulo' do
			user = User.new(primerNombre: nil)
			user.save
			#puts user.errors.messages
			expect(user.errors[:primerNombre]).to include("can't be blank")
		end

		it 'el primer nombre debe ser correcto' do
			user = User.new(primerNombre: "Joseph")
			user.save
			expect(user.errors[:primerNombre]).to be_empty
		end
	end

end

# posibles cadenas de errores

# :password=>["can't be blank"],
# :email=>["can't be blank","is too short (minimum is 10 characters)","el correo debe ser alfanumerico@alfanumerico.alfanumerico"],
# :tipoDocumento=>["can't be blank"],
# :identificacion=>["can't be blank","is too short (minimum is 6 characters)","is not a number"],
# :primerApellido=>["can't be blank","is too short (minimum is 2 characters)"],
# :sexo=>["can't be blank","is not included in the list"],
# :fechaNacimiento=>["can't be blank"],
# :estadoCivil=>["can't be blank"],
# :confesionReligiosa=>["can't be blank"],
# :nivelAcademico=>["can't be blank","is not included in the list"],
# :profesionOficio=>["can't be blank"],
# :telefono=>["can't be blank","is the wrong length (should be 10 characters)","is not a number"],
# :fueMiembroOtraIglesia=>["is not included in the list"],
# :bautizadoAdulto=>["is not included in the list"]