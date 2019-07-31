class MaterialsController < ApplicationController
  before_action :set_material, only: [:show, :edit, :update, :destroy]
  before_action :set_materialC, only: [:compartir, :publicar]
  # GET /materials
  # GET /materials.json
  def index
    @materials = Material.all
  end

  # GET /materials/1
  # GET /materials/1.json
  def show
  end

  # GET /materials/new
  def new
    @material = Material.new
  end

  # GET /materials/1/edit
  def edit
  end

  def compartir
    #code
    @groups = Group.where(user_id: current_user, activo: true )
    @publication = Publication.new
  end
  def publicar
    # lista de grupos en los cuales publicar el contenido
    @lista = params[:publicacion][:lista]
    ActiveRecord::Base.transaction do
      @lista.each do |grupo|
        if grupo != ""
          publi = Publication.new
          publi.titulo = publication_params[:titulo]
          publi.descripcion = publication_params[:descripcion]
          #copiar contenido
          puts "esto tiene material"
          puts @material.inspect
        #  publi.remote_multimedia_url = @material.pdf_url
          publi.material = @material
          #en grupo se publicara
          publi.group_id = grupo
          #quien lo publicó
          publi.user = current_user
          puts "esto tiene publi antes de gusrdarlo"
          puts publi.inspect
          publi.save
        end
      end
      respond_to do |format|
        format.html {redirect_to publications_path, notice: 'Publicaciones creadas'}
      end
    end

    #@asistensia.asistio = @lista.include?(matricula.user.id.to_s)

  end

  # POST /materials
  # POST /materials.json
  def create
    @material = Material.new(material_params)

    respond_to do |format|
      if @material.save
        format.html { redirect_to @material, notice: 'Material was successfully created.' }
        format.json { render :show, status: :created, location: @material }
      else
        format.html { render :new }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /materials/1
  # PATCH/PUT /materials/1.json
  def update
    respond_to do |format|
      if @material.update(material_params)
        format.html { redirect_to @material, notice: 'Material was successfully updated.' }
        format.json { render :show, status: :ok, location: @material }
      else
        format.html { render :edit }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materials/1
  # DELETE /materials/1.json
  def destroy
    @material.destroy
    respond_to do |format|
      format.html { redirect_to materials_url, notice: 'Material was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material
      @material = Material.find(params[:id])
    end
    def set_materialC
      @material = Material.find(params[:material_id])
      #code
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def material_params
      params.require(:material).permit(:descripcion, :imagen, :pdf)
    end

    def publication_params
      params.require(:publication).permit(:titulo, :descripcion, publicacion: {} )
    end
end
