class PrincipalController < ApplicationController
	#before_action :confirmar_contrasena, only: [:home]
  def home
    @publications= Publication.all
    @publicaciones= Publication.where(group_id: nil)
  end

  def invitado
    @publications= Publication.all

  end
  def docente

  end
  def administrador

  end

  protected
  def confirmar_contrasena
  	if current_user.confirmado?
  		#evaluar su rol y redireccionarlo al path correspondiente
  		render :home
  		else
  			redirect_to password_index_path
  	end
  end
  	def home_confirmar

  	end
end
