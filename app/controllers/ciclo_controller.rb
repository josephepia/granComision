class CicloController < ApplicationController
  before_action :inicializar
  before_action :ciclo_params, except: [:cargarNotas]
  def iniciar
  end

  def cerrar
    correcto= true

    @group = Group.find(params[:group_id])
    matriculas= Enroll.where(group: @group).all    #lista de matriculas de este grupo

    fechaCierre = Time.new()
    #crear cursos impartidos
    @cursoImpartido = GivenCourse.new
    @cursoImpartido.idGrupo = @group.id
    @cursoImpartido.discipleship = @group.discipleship
    @cursoImpartido.user = @group.user
    @cursoImpartido.fechaInicio = @group.created_at
    @cursoImpartido.fechaCierre = fechaCierre


    #inicio de la tranasaccion 
    ## crear curso impartido---- cursos extendidos
    ## crear notas extendidas
    ## eliminar grupo
    ActiveRecord::Base.transaction do
      @cursoImpartido.save
      matriculas.each do |matricula|
        @notaExtendida = ExtendedNote.new
        @notaExtendida.discipleship = @group.discipleship
        @notaExtendida.user = matricula.user
        @notaExtendida.idGrupo = @group.id
        @notaExtendida.definitiva = (matricula.definitiva || 'reprobado')
        @notaExtendida.fecha = fechaCierre
        @notaExtendida.save
        



      end
      #elimino todas las mtriculas de ese grupo
      #matriculas.destroy_all
      @group.destroy

      respond_to do |format|
        format.html {redirect_to discipleships_path, notice: 'Notas registradas correctamente'}
      end
    end
    # fin de la transaccion

    # if @cursoImpartido.save

    # else
    #   correcto = false
    # end

    # #crear notas extendidas
    # matriculas= Enroll.where(group: params[:group_id]).all    #lista de matriculas de este grupo

    # matriculas.each do |matricula|
    #   @notaExtendida = ExtendedNote.new
    #   @notaExtendida.discipleship = @group.discipleship
    #   @notaExtendida.user = matricula.user
    #   @notaExtendida.idGrupo = @group.id
    #   @notaExtendida.definitiva = (matricula.definitiva || 'reprobado')
    #   @notaExtendida.fecha = fechaCierre
    #   if @notaExtendida.save
    #     # elimino la matricula

    #   else
    #     correcto = false
    #   end


    # end
    
    #   @group.destroy

    # if correcto
    #   #elimino todas las matriculas
    #   #matriculas.destroy_all
    #   #elimino el grupo, y en cascada se eliminaran los horarios, fallas, y matriculas.
    #   respond_to do |format|
    #     format.html {redirect_to discipleships_path, notice: 'Notas registradas correctamente'}
    #   end
    # else
    #   respond_to do |format|
    #     format.html {redirect_to discipleships_path, notice: 'Ocurrio un error al guardar las notas'}
    #   end
    # end


  end

  def index
  	
  end

  def guardarNotas
    @lista = params[:notas][:lista]
    matriculas= Enroll.where(group: params[:group_id]).all    #lista de matriculas de este grupo
    correcto = true
    matriculas.each do |matricula|

      puts "comparare id user #{matricula.user.id}, con id falla... #{@lista.include?(matricula.user.id.to_s)}"

      if @lista.include?(matricula.user.id.to_s) 
        
        
        if matricula.update(definitiva: 'aprobado')

        else
           correcto = false
        end
      else
        if matricula.update(definitiva: 'reprobado')

        else
           correcto = false
        end
      end
    end
    if correcto
      respond_to do |format|
        format.html {redirect_to group_ciclo_notas_path, notice: 'Notas registradas correctamente'}
      end
    else
      respond_to do |format|
        format.html {redirect_to group_ciclo_notas_path, notice: 'Ocurrio un error al guardar las notas'}
      end
    end
  end

  def cargarNotas
      @students=User.joins(:enrolls).where({enrolls: {group: @group }})
      @group = Group.find(params[:group_id])
    render :partial => "cargar_notas"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def inicializar
      @group = Group.find(params[:group_id])
      @asistencia=Enroll.new
     # @estudiantesConFallas=User.joins(enrolls: :failures).where({enrolls: {group: @group, failures:{created_at: (@dia.beginning_of_day)..@dia.end_of_day,} }})
  	
	     @students=User.joins(:enrolls).where({enrolls: {group: @group }})
       @estudiantesAprobados = User.joins(:enrolls).where({enrolls: {group: @group, definitiva: 'aprobado' }}) 
  	
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ciclo_params
      params.permit(:utf8, :authenticity_token, :commit, :group_id, notas: {})
    end
end
