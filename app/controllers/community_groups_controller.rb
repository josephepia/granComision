class CommunityGroupsController < ApplicationController
  before_action :set_community_group, only: [:show, :edit, :update, :destroy]

  # GET /community_groups
  # GET /community_groups.json
  def index
    @community_groups = CommunityGroup.all
  end

  # GET /community_groups/1
  # GET /community_groups/1.json
  def show
  end

  # GET /community_groups/new
  def new
    @community_group = CommunityGroup.new
  end

  # GET /community_groups/1/edit
  def edit
  end

  # POST /community_groups
  # POST /community_groups.json
  def create
    @community_group = CommunityGroup.new(community_group_params)

    respond_to do |format|
      if @community_group.save
        format.html { redirect_to @community_group, notice: 'Community group was successfully created.' }
        format.json { render :show, status: :created, location: @community_group }
      else
        format.html { render :new }
        format.json { render json: @community_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /community_groups/1
  # PATCH/PUT /community_groups/1.json
  def update
    respond_to do |format|
      if @community_group.update(community_group_params)
        format.html { redirect_to @community_group, notice: 'Community group was successfully updated.' }
        format.json { render :show, status: :ok, location: @community_group }
      else
        format.html { render :edit }
        format.json { render json: @community_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /community_groups/1
  # DELETE /community_groups/1.json
  def destroy
    @community_group.destroy
    respond_to do |format|
      format.html { redirect_to community_groups_url, notice: 'Community group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community_group
      @community_group = CommunityGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def community_group_params
      params.require(:community_group).permit(:nombre)
    end
end
