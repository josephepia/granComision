class Horary < ApplicationRecord
  belongs_to :group

  def lunes
    "#{lunesInicio} - #{lunesFinal}"
    
  end
  def martes
    "#{martesInicio} - #{martesFinal}"
    
  end
  def miercoles
    "#{miercolesInicio} - #{miercolesFinal}"
    
  end
  def jueves
    "#{juevesInicio} - #{juevesFinal}"
    
  end
  def viernes
    "#{viernesInicio} - #{viernesFinal}"
    
  end
  def sabado
    "#{sabadoInicio} - #{sabadoFinal}"
    
  end
  def domingo
    "#{domingoInicio} - #{domingoFinal}"
    
  end
  
end
