class ExtendedNotesController < ApplicationController
  before_action :set_extended_note, only: [:show, :edit, :update, :destroy]

  # GET /extended_notes
  # GET /extended_notes.json
  def index
    @extended_notes = ExtendedNote.all
  end

  # GET /extended_notes/1
  # GET /extended_notes/1.json
  def show
  end

  # GET /extended_notes/new
  def new
    @extended_note = ExtendedNote.new
  end

  # GET /extended_notes/1/edit
  def edit
  end

  # POST /extended_notes
  # POST /extended_notes.json
  def create
    @extended_note = ExtendedNote.new(extended_note_params)

    respond_to do |format|
      if @extended_note.save
        format.html { redirect_to @extended_note, notice: 'Extended note was successfully created.' }
        format.json { render :show, status: :created, location: @extended_note }
      else
        format.html { render :new }
        format.json { render json: @extended_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /extended_notes/1
  # PATCH/PUT /extended_notes/1.json
  def update
    respond_to do |format|
      if @extended_note.update(extended_note_params)
        format.html { redirect_to @extended_note, notice: 'Extended note was successfully updated.' }
        format.json { render :show, status: :ok, location: @extended_note }
      else
        format.html { render :edit }
        format.json { render json: @extended_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /extended_notes/1
  # DELETE /extended_notes/1.json
  def destroy
    @extended_note.destroy
    respond_to do |format|
      format.html { redirect_to extended_notes_url, notice: 'Extended note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_extended_note
      @extended_note = ExtendedNote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def extended_note_params
      params.require(:extended_note).permit(:definitiva, :fecha, :idGrupo, :discipleship_id, :student_id)
    end
end
