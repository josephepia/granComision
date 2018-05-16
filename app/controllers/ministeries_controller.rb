class MinisteriesController < ApplicationController
  before_action :set_ministery, only: [:show, :edit, :update, :destroy]

  # GET /ministeries
  # GET /ministeries.json
  def index
    @ministeries = Ministery.all
  end

  # GET /ministeries/1
  # GET /ministeries/1.json
  def show
  end

  # GET /ministeries/new
  def new
    @ministery = Ministery.new
  end

  # GET /ministeries/1/edit
  def edit
  end

  # POST /ministeries
  # POST /ministeries.json
  def create
    @ministery = Ministery.new(ministery_params)

    respond_to do |format|
      if @ministery.save
        format.html { redirect_to @ministery, notice: 'Ministery was successfully created.' }
        format.json { render :show, status: :created, location: @ministery }
      else
        format.html { render :new }
        format.json { render json: @ministery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ministeries/1
  # PATCH/PUT /ministeries/1.json
  def update
    respond_to do |format|
      if @ministery.update(ministery_params)
        format.html { redirect_to @ministery, notice: 'Ministery was successfully updated.' }
        format.json { render :show, status: :ok, location: @ministery }
      else
        format.html { render :edit }
        format.json { render json: @ministery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ministeries/1
  # DELETE /ministeries/1.json
  def destroy
    @ministery.destroy
    respond_to do |format|
      format.html { redirect_to ministeries_url, notice: 'Ministery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ministery
      @ministery = Ministery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ministery_params
      params.require(:ministery).permit(:nombre, :text)
    end
end
