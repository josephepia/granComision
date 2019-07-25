class CovenantsController < ApplicationController
  before_action :set_covenant, only: [:show, :edit, :update, :destroy]

  # GET /covenants
  # GET /covenants.json
  def index
    @covenants = Covenant.all
  end

  # GET /covenants/1
  # GET /covenants/1.json
  def show
  end

  # GET /covenants/new
  def new
    @covenant = Covenant.new
  end

  # GET /covenants/1/edit
  def edit
  end

  # POST /covenants
  # POST /covenants.json
  def create
    @covenant = Covenant.new(covenant_params)

    respond_to do |format|
      if @covenant.save
        format.html { redirect_to @covenant, notice: 'Covenant was successfully created.' }
        format.json { render :show, status: :created, location: @covenant }
      else
        format.html { render :new }
        format.json { render json: @covenant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /covenants/1
  # PATCH/PUT /covenants/1.json
  def update
    respond_to do |format|
      if @covenant.update(covenant_params)
        format.html { redirect_to @covenant, notice: 'Covenant was successfully updated.' }
        format.json { render :show, status: :ok, location: @covenant }
      else
        format.html { render :edit }
        format.json { render json: @covenant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /covenants/1
  # DELETE /covenants/1.json
  def destroy
    @covenant.destroy
    respond_to do |format|
      format.html { redirect_to covenants_url, notice: 'Covenant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_covenant
      @covenant = Covenant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def covenant_params
      params.require(:covenant).permit(:pdf, :discipleship_id)
    end
end
