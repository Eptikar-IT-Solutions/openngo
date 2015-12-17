class ProjectDonorsController < ApplicationController
  before_action :set_project_donor, only: [:show, :edit, :update, :destroy]

  # GET /project_donors
  # GET /project_donors.json
  def index
    @project_donors = ProjectDonor.all
  end

  # GET /project_donors/1
  # GET /project_donors/1.json
  def show
  end

  # GET /project_donors/new
  def new
    @project_donor = ProjectDonor.new
  end

  # GET /project_donors/1/edit
  def edit
  end

  # POST /project_donors
  # POST /project_donors.json
  def create
    @project_donor = ProjectDonor.new(project_donor_params)

    respond_to do |format|
      if @project_donor.save
        format.html { redirect_to @project_donor, notice: 'Project donor was successfully created.' }
        format.json { render :show, status: :created, location: @project_donor }
      else
        format.html { render :new }
        format.json { render json: @project_donor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_donors/1
  # PATCH/PUT /project_donors/1.json
  def update
    respond_to do |format|
      if @project_donor.update(project_donor_params)
        format.html { redirect_to @project_donor, notice: 'Project donor was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_donor }
      else
        format.html { render :edit }
        format.json { render json: @project_donor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_donors/1
  # DELETE /project_donors/1.json
  def destroy
    @project_donor.destroy
    respond_to do |format|
      format.html { redirect_to project_donors_url, notice: 'Project donor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_donor
      @project_donor = ProjectDonor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_donor_params
      params.require(:project_donor).permit(:project_id, :donor_id, :created_by, :updated_by)
    end
end
