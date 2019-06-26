class AsistenciaController < ApplicationController
	before_action :inicializar, only: [:index, :create]
	before_action :asistencia_params, except: [:cargar_dia]
  # GET /cities
  # GET /cities.json
  def index
    #@students=User.joins(:enrolls).where({enrolls: {created_at: (Time.now.beginning_of_day)..Time.now.end_of_day,group: @group }})
    #cargo una lista de los estudiantes matriculados en el grupo que se esta visualizando 
    @students=User.joins(:enrolls).where({enrolls: {group: @group }})
  end


  def cargar_dia
    @group = Group.find(params[:group])
  	@dia= (params[:fecha]).to_datetime
  	#@estudiantesConFallas=User.joins(:enrolls).where({enrolls: {created_at: (@dia.beginning_of_day)..@dia.end_of_day,group: @group }}).all
  	@estudiantesConAsistensia=User.joins(enrolls: :failures).where({enrolls: {group: @group, failures:{created_at: (@dia.beginning_of_day)..@dia.end_of_day, asistio: true} }})
  	puts "estos son los estudiantes con asistensia #{@estudiantesConAsistensia.inspect}"
  	@students=User.joins(:enrolls).where({enrolls: {group: @group }})
  	
  	
		#User.joins(:enrolls).where({enrolls: {created_at: (Time.now.beginning_of_day)..Time.now.end_of_day,group_id: 1 }}).all
    render :partial => "asistencia_diaria"
  	
  end
  # GET /cities/1
  # GET /cities/1.json
  def show
  end

  # GET /cities/new
  def new
    @city = City.new
  end

  # GET /cities/1/edit
  def edit
  end

  # POST /cities
  # POST /cities.json
  def create
  	
    @lista = params[:asistencia][:lista] 				             	#lista de estudiantes con fallas 
    matriculas= Enroll.where(group: params[:group_id]).all 		#lista de matriculas de este grupo
    correcto = true

    #recorro la lista de estudiantes matricualdos 
    matriculas.each do |matricula|

    	puts "comparare id user #{matricula.user.id}, con id falla... #{@lista.include?(matricula.user.id.to_s)}"
      # verifico cada registro de la tabla matricula en busca de coincidencia con la lista de asistencia
      @asistensia = Failure.new
      puts @asistensia.inspect

    	
    		@asistensia.asistio = @lista.include?(matricula.user.id.to_s)
    		@asistensia.fecha = @asistensia.created_at
    		puts @asistensia.inspect
    		@asistensia.group_id = params[:group_id]
    		puts @asistensia.inspect
    		@asistensia.enroll = matricula
    		puts @asistensia.inspect
    		if @asistensia.save
    		else
    		   correcto==false
    		end
			   
    	
    end
    if correcto
	    respond_to do |format|
				format.html {redirect_to group_asistencia_path, notice: 'Asistencia registrada correctamente'}
			end
    else
			respond_to do |format|
				format.html {redirect_to group_asistencia_path, notice: 'Ocurrio un error al guardar la asistencia'}
			end
    end

    # respond_to do |format|
			      
			 #        format.html { render :index, notice: 'Asistencias registradas correctamente'}
			        
			     
    # 			end
    # respond_to do |format|
    #   if @city.save
    #     format.html { redirect_to @city, notice: 'City was successfully created.' }
    #     format.json { render :show, status: :created, location: @city }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @city.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /cities/1
  # PATCH/PUT /cities/1.json
  def update
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to @city, notice: 'City was successfully updated.' }
        format.json { render :show, status: :ok, location: @city }
      else
        format.html { render :edit }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cities/1
  # DELETE /cities/1.json
  def destroy
    @city.destroy
    respond_to do |format|
      format.html { redirect_to cities_url, notice: 'City was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def inicializar
      @group = Group.find(params[:group_id])
      @asistencia=Enroll.new
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asistencia_params
      params.permit(:utf8, :authenticity_token, :commit, :group_id, asistencia: {})
    end
end
