class AddressChurchAndDocumentExpeditionsController < ApplicationController
  before_action :set_address_church_and_document_expedition, only: [:show, :edit, :update, :destroy]

  # GET /address_church_and_document_expeditions
  # GET /address_church_and_document_expeditions.json
  def index
    @address_church_and_document_expeditions = AddressChurchAndDocumentExpedition.all
  end

  # GET /address_church_and_document_expeditions/1
  # GET /address_church_and_document_expeditions/1.json
  def show
  end

  # GET /address_church_and_document_expeditions/new
  def new
    @address_church_and_document_expedition = AddressChurchAndDocumentExpedition.new
  end

  # GET /address_church_and_document_expeditions/1/edit
  def edit
  end

  # POST /address_church_and_document_expeditions
  # POST /address_church_and_document_expeditions.json
  def create
    @address_church_and_document_expedition = AddressChurchAndDocumentExpedition.new(address_church_and_document_expedition_params)

    respond_to do |format|
      if @address_church_and_document_expedition.save
        format.html { redirect_to @address_church_and_document_expedition, notice: 'Address church and document expedition was successfully created.' }
        format.json { render :show, status: :created, location: @address_church_and_document_expedition }
      else
        format.html { render :new }
        format.json { render json: @address_church_and_document_expedition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /address_church_and_document_expeditions/1
  # PATCH/PUT /address_church_and_document_expeditions/1.json
  def update
    respond_to do |format|
      if @address_church_and_document_expedition.update(address_church_and_document_expedition_params)
        format.html { redirect_to @address_church_and_document_expedition, notice: 'Address church and document expedition was successfully updated.' }
        format.json { render :show, status: :ok, location: @address_church_and_document_expedition }
      else
        format.html { render :edit }
        format.json { render json: @address_church_and_document_expedition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /address_church_and_document_expeditions/1
  # DELETE /address_church_and_document_expeditions/1.json
  def destroy
    @address_church_and_document_expedition.destroy
    respond_to do |format|
      format.html { redirect_to address_church_and_document_expeditions_url, notice: 'Address church and document expedition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address_church_and_document_expedition
      @address_church_and_document_expedition = AddressChurchAndDocumentExpedition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_church_and_document_expedition_params
      params.require(:address_church_and_document_expedition).permit(:nombreIglesiaAnterior, :direccionIglesia, :user_id, :city_id)
    end
end
