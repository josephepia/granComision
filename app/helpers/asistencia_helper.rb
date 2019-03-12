module AsistenciaHelper
	def asistio(id)
		
		if @students
			@estudiantesConFallas.each do |student|
				if student.id==id
					return false				
				end
			end
			
		end
		return true
	end
end
