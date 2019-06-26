module AsistenciaHelper
	
	def asistio(id)
		if @students
			@estudiantesConAsistensia.each do |student|
				if student.id==id
					return true				
				end
			end
			
		end
		return false
	end
end
