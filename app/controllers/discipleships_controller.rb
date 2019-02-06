class DiscipleshipsController < ApplicationController
  before_action :set_discipleship, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /discipleships
  # GET /discipleships.json
  def index
    @discipleships = Discipleship.all
    
  end

  # GET /discipleships/1
  # GET /discipleships/1.json
  def show
    @group= Group.new
    
  end

  # GET /discipleships/new
  def new
    @discipleship = Discipleship.new
    
  end

  # GET /discipleships/1/edit
  def edit
  end

  # POST /discipleships
  # POST /discipleships.json
  def create
    @discipleship = Discipleship.new(discipleship_params)

    respond_to do |format|
      if @discipleship.save
        format.html { redirect_to @discipleship, notice: 'Discipulado creado correctamente.' }
        format.json { render :show, status: :created, location: @discipleship }
      else
        format.html { render :new }
        format.json { render json: @discipleship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discipleships/1
  # PATCH/PUT /discipleships/1.json
  def update
    respond_to do |format|
      if @discipleship.update(discipleship_params)
        format.html { redirect_to @discipleship, notice: 'Discipleship actualizado correctamente' }
        format.json { render :show, status: :ok, location: @discipleship }
      else
        format.html { render :edit }
        format.json { render json: @discipleship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discipleships/1
  # DELETE /discipleships/1.json
  def destroy
    @discipleship.destroy
    respond_to do |format|
      format.html { redirect_to discipleships_url, notice: 'Discipulado eliminado correctamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discipleship
      @discipleship = Discipleship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discipleship_params
      params.require(:discipleship).permit(:nombre, :rangoOtorgado, :descripcion, :descripcionPacto)
    end
end
