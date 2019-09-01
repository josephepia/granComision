class PreviousChurchesController < ApplicationController
  before_action :set_previous_church, only: [:show, :edit, :update, :destroy]

  # GET /previous_churches
  # GET /previous_churches.json
  def index
    @previous_churches = PreviousChurch.all
  end

  # GET /previous_churches/1
  # GET /previous_churches/1.json
  def show
  end

  # GET /previous_churches/new
  def new
    @previous_church = PreviousChurch.new
  end

  # GET /previous_churches/1/edit
  def edit
  end

  # POST /previous_churches
  # POST /previous_churches.json
  def create
    @previous_church = PreviousChurch.new(previous_church_params)

    respond_to do |format|
      if @previous_church.save
        format.html { redirect_to @previous_church, notice: 'Previous church was successfully created.' }
        format.json { render :show, status: :created, location: @previous_church }
      else
        format.html { render :new }
        format.json { render json: @previous_church.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /previous_churches/1
  # PATCH/PUT /previous_churches/1.json
  def update
    respond_to do |format|
      if @previous_church.update(previous_church_params)
        format.html { redirect_to @previous_church, notice: 'Previous church was successfully updated.' }
        format.json { render :show, status: :ok, location: @previous_church }
      else
        format.html { render :edit }
        format.json { render json: @previous_church.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /previous_churches/1
  # DELETE /previous_churches/1.json
  def destroy
    @previous_church.destroy
    respond_to do |format|
      format.html { redirect_to previous_churches_url, notice: 'Previous church was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_previous_church
      @previous_church = PreviousChurch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def previous_church_params
      params.require(:previous_church).permit(:nombre, :tiempo, :address_id, :user_id)
    end
end
