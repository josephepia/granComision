class EnrollsController < ApplicationController
  before_action :set_enroll, only: [:show, :edit, :update, :destroy]
  before_action :inicializar_variables, only: [:new, :cargar_grupos]
  # GET /enrolls
  # GET /enrolls.json
  def cargar_grupos
    if @combo =='grupo'
    @group=Group.where(id: params[:discipleship_id]).first
    end

    if @combo == 'discipleship'
    @group=Group.new
    @groups=Group.where(discipleship_id: params[:discipleship_id], activo: true).all
      
    end
    if @combo=='estudiante'
      @estudiante=User.find_by(identificacion: params[:discipleship_id])
    end
    render partial: "grupos", object: @group
  end
  def index
    
    @enrolls = Enroll.all

  end

  # GET /enrolls/1
  # GET /enrolls/1.json
  def show
  end

  # GET /enrolls/new
  def new

  end

  # GET /enrolls/1/edit
  def edit
  end

  # POST /enrolls
  # POST /enrolls.json
  def create
    @enroll = Enroll.new
    @enroll.group_id=enroll_params[:group_id]
    @enroll.user= User.find_by(identificacion: enroll_params[:cedulaEstudiante])

    respond_to do |format|
      if @enroll.save
        format.html { redirect_to new_enroll_path, notice: 'Matriculado correctamente' }
        format.json { render :show, status: :created, location: @enroll }
      else
        format.html { render :new }
        format.json { render json: @enroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enrolls/1
  # PATCH/PUT /enrolls/1.json
  def update
    respond_to do |format|
      if @enroll.update(enroll_params)
        format.html { redirect_to @enroll, notice: 'Enroll was successfully updated.' }
        format.json { render :show, status: :ok, location: @enroll }
      else
        format.html { render :edit }
        format.json { render json: @enroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrolls/1
  # DELETE /enrolls/1.json
  def destroy
    @enroll.destroy
    respond_to do |format|
      format.html { redirect_to enrolls_url, notice: 'Enroll was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enroll
      @enroll = Enroll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enroll_params
      params.require(:enroll).permit(:group_id, :cedulaEstudiante)
    end
    def inicializar_variables
      @groups=Group.all
      @group= Group.new
      @enroll = Enroll.new
      @combo= params[:combo]

    end
end
