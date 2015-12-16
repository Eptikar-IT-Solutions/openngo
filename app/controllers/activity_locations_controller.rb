class ActivityLocationsController < ApplicationController
  before_action :set_activity_location, only: [:show, :edit, :update, :destroy]

  # GET /activity_locations
  # GET /activity_locations.json
  def index
    @activity_locations = ActivityLocation.all
  end

  # GET /activity_locations/1
  # GET /activity_locations/1.json
  def show
  end

  # GET /activity_locations/new
  def new
    @activity_location = ActivityLocation.new
  end

  # GET /activity_locations/1/edit
  def edit
  end

  # POST /activity_locations
  # POST /activity_locations.json
  def create
    @activity_location = ActivityLocation.new(activity_location_params)

    respond_to do |format|
      if @activity_location.save
        format.html { redirect_to @activity_location, notice: 'Activity location was successfully created.' }
        format.json { render :show, status: :created, location: @activity_location }
      else
        format.html { render :new }
        format.json { render json: @activity_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_locations/1
  # PATCH/PUT /activity_locations/1.json
  def update
    respond_to do |format|
      if @activity_location.update(activity_location_params)
        format.html { redirect_to @activity_location, notice: 'Activity location was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity_location }
      else
        format.html { render :edit }
        format.json { render json: @activity_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_locations/1
  # DELETE /activity_locations/1.json
  def destroy
    @activity_location.destroy
    respond_to do |format|
      format.html { redirect_to activity_locations_url, notice: 'Activity location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_location
      @activity_location = ActivityLocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_location_params
      params.require(:activity_location).permit(:activity_id, :location_id, :created_by, :updated_by)
    end
end
