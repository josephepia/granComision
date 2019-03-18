class GroupsController < ApplicationController
  before_action :set_discipleship, only: [:index,:create, :new]
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  # GET /groups
  # GET /groups.json
  def index
  end

  def inscribirme
    
    
    if( @user.enrolled_in_discipleship(params[:discipleship_id]))
      respond_to do |format|
        format.html { redirect_to discipleships_path, notice: 'Ya estas inscrito' }    
      end
    else
      respond_to do |format|
        format.html { redirect_to discipleships_path, notice: 'Inscrito exitosamente' }    
      end
    end
  end
  
  # GET /groups/1
  # GET /groups/1.json
  def show
   
  end

  # GET /groups/new
  def new
    @group = Group.new
    @horary = Horary.new
    @docentes= User.joins(:roles).where(roles: { nombre: 'docente' })
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    @group.discipleship = @discipleship
    @group.horary = Horary.new(horary_params)
    respond_to do |format|
      if @group.save
        format.html { redirect_to discipleship_path(@group.discipleship), notice: 'Gropo creado exitosamente' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        @horary.update(horary_params)
        format.html { redirect_to group_path(@group), notice: 'El grupo fue actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to discipleship_path(@discipleship) , notice: 'Grupo eliminado exitosamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discipleship
      if params[:discipleship_id]
      @discipleship = Discipleship.find(params[:discipleship_id])  
      @datos=[@discipleship,@group ||= Group.new]
      @groups = @discipleship.groups

      else
        @datos=[@group ||= Group.new]
        @groups = Group.all

      end
    end
    
    def set_group

      @group = Group.find(params[:id])
      @discipleship= @group.discipleship
      @horary = Horary.find_by(group_id: params[:id])
      #@docentes= @group.user
      @docentes= User.joins(:roles).where(roles: { nombre: 'docente' })
      @students= Enroll.where(group: @group)
      @datos=[@group]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:nombre, :user_id,:activo)
    end

    def horary_params
      params.require(:horary).permit(:lunesInicio,:lunesFinal,:martesInicio,:martesFinal,:miercolesInicio,:miercolesFinal,:juevesInicio,:juevesFinal,:viernesInicio,:viernesFinal,:sabadoInicio,:sabadoFinal,:domingoInicio,:domingoFinal)      
    end
    
end
