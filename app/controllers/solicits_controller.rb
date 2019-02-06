class SolicitsController < ApplicationController
  before_action :set_solicit, only: [:show, :edit, :update, :destroy]

  # GET /solicits
  # GET /solicits.json
  def index
    @solicits = Solicit.all
  end

  # GET /solicits/1
  # GET /solicits/1.json
  def show
  end

  # GET /solicits/new
  def new
    @solicit = Solicit.new
  end

  # GET /solicits/1/edit
  def edit
  end

  # POST /solicits
  # POST /solicits.json
  def create
    @solicit = Solicit.new(solicit_params)

    respond_to do |format|
      if @solicit.save
        format.html { redirect_to @solicit, notice: 'Solicit was successfully created.' }
        format.json { render :show, status: :created, location: @solicit }
      else
        format.html { render :new }
        format.json { render json: @solicit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solicits/1
  # PATCH/PUT /solicits/1.json
  def update
    respond_to do |format|
      if @solicit.update(solicit_params)
        format.html { redirect_to @solicit, notice: 'Solicit was successfully updated.' }
        format.json { render :show, status: :ok, location: @solicit }
      else
        format.html { render :edit }
        format.json { render json: @solicit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solicits/1
  # DELETE /solicits/1.json
  def destroy
    @solicit.destroy
    respond_to do |format|
      format.html { redirect_to solicits_url, notice: 'Solicit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solicit
      @solicit = Solicit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def solicit_params
      params.require(:solicit).permit(:user_id, :discipleship_id)
    end
end
