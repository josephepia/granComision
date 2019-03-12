module CicloHelper
	def aprobado(id)
		if @students
			@estudiantesAprobados.each do |student|
				if student.id==id
					return true				
				end
			end
			
		end
		return false
	end
end
