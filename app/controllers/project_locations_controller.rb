class ProjectLocationsController < ApplicationController
  before_action :set_project_location, only: [:show, :edit, :update, :destroy]

  # GET /project_locations
  # GET /project_locations.json
  def index
    @project_locations = ProjectLocation.all
  end

  # GET /project_locations/1
  # GET /project_locations/1.json
  def show
  end

  # GET /project_locations/new
  def new
    @project_location = ProjectLocation.new
  end

  # GET /project_locations/1/edit
  def edit
  end

  # POST /project_locations
  # POST /project_locations.json
  def create
    @project_location = ProjectLocation.new(project_location_params)

    respond_to do |format|
      if @project_location.save
        format.html { redirect_to @project_location, notice: 'Project location was successfully created.' }
        format.json { render :show, status: :created, location: @project_location }
      else
        format.html { render :new }
        format.json { render json: @project_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_locations/1
  # PATCH/PUT /project_locations/1.json
  def update
    respond_to do |format|
      if @project_location.update(project_location_params)
        format.html { redirect_to @project_location, notice: 'Project location was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_location }
      else
        format.html { render :edit }
        format.json { render json: @project_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_locations/1
  # DELETE /project_locations/1.json
  def destroy
    @project_location.destroy
    respond_to do |format|
      format.html { redirect_to project_locations_url, notice: 'Project location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_location
      @project_location = ProjectLocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_location_params
      params.require(:project_location).permit(:project_id, :location_id)
    end
end
