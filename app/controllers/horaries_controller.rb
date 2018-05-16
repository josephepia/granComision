class HorariesController < ApplicationController
  before_action :set_horary, only: [:show, :edit, :update, :destroy]

  # GET /horaries
  # GET /horaries.json
  def index
    @horaries = Horary.all
  end

  # GET /horaries/1
  # GET /horaries/1.json
  def show
  end

  # GET /horaries/new
  def new
    @horary = Horary.new
  end

  # GET /horaries/1/edit
  def edit
  end

  # POST /horaries
  # POST /horaries.json
  def create
    @horary = Horary.new(horary_params)

    respond_to do |format|
      if @horary.save
        format.html { redirect_to @horary, notice: 'Horary was successfully created.' }
        format.json { render :show, status: :created, location: @horary }
      else
        format.html { render :new }
        format.json { render json: @horary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /horaries/1
  # PATCH/PUT /horaries/1.json
  def update
    respond_to do |format|
      if @horary.update(horary_params)
        format.html { redirect_to @horary, notice: 'Horary was successfully updated.' }
        format.json { render :show, status: :ok, location: @horary }
      else
        format.html { render :edit }
        format.json { render json: @horary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /horaries/1
  # DELETE /horaries/1.json
  def destroy
    @horary.destroy
    respond_to do |format|
      format.html { redirect_to horaries_url, notice: 'Horary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_horary
      @horary = Horary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def horary_params
      params.require(:horary).permit(:lunes, :martes, :miercoles, :jueves, :viernes, :sabado, :domingo, :group_id)
    end
end
