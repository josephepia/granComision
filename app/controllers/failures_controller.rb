class FailuresController < ApplicationController
  before_action :set_failure, only: [:show, :edit, :update, :destroy]

  # GET /failures
  # GET /failures.json
  def index
    @failures = Failure.all
    @groups = Group.joins(:discipleship, :user).where(activo: true)
    @failure= Failure.new
    
  end

  # GET /failures/1
  # GET /failures/1.json
  def show
  end

  # GET /failures/new
  def new
    # creo la instaccia de asistensia
    @failure = Failure.new
    # creo lista de estudiantes matricualdos en este grupo. para tomar su asistencia
    @estudiantes= User.joins(:enrolls).where({enrolls: {id: params[:group_id] }})
  end

  # GET /failures/1/edit
  def edit
  end

  # POST /failures
  # POST /failures.json
  def create
    @failure = Failure.new(failure_params)

    respond_to do |format|
      if @failure.save
        format.html { redirect_to @failure, notice: 'Failure was successfully created.' }
        format.json { render :show, status: :created, location: @failure }
      else
        format.html { render :new }
        format.json { render json: @failure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /failures/1
  # PATCH/PUT /failures/1.json
  def update
    respond_to do |format|
      if @failure.update(failure_params)
        format.html { redirect_to @failure, notice: 'Failure was successfully updated.' }
        format.json { render :show, status: :ok, location: @failure }
      else
        format.html { render :edit }
        format.json { render json: @failure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /failures/1
  # DELETE /failures/1.json
  def destroy
    @failure.destroy
    respond_to do |format|
      format.html { redirect_to failures_url, notice: 'Failure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_failure
      @failure = Failure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def failure_params
      params.require(:failure).permit(:fecha, :enroll_id, :session_id)
    end
end
