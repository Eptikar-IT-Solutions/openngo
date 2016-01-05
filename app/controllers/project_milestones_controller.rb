class ProjectMilestonesController < ApplicationController
  load_and_authorize_resource
  before_action :set_project_milestone, only: [:show, :edit, :update, :destroy]

  # GET /project_milestones
  # GET /project_milestones.json
  def index
    @project_milestones = ProjectMilestone.all
  end

  # GET /project_milestones/1
  # GET /project_milestones/1.json
  def show
  end

  # GET /project_milestones/new
  def new
    @project_milestone = ProjectMilestone.new
  end

  # GET /project_milestones/1/edit
  def edit
  end

  # POST /project_milestones
  # POST /project_milestones.json
  def create
    @project_milestone = ProjectMilestone.new(project_milestone_params)

    respond_to do |format|
      if @project_milestone.save
        format.html { redirect_to @project_milestone, notice: 'Project milestone was successfully created.' }
        format.json { render :show, status: :created, location: @project_milestone }
      else
        format.html { render :new }
        format.json { render json: @project_milestone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_milestones/1
  # PATCH/PUT /project_milestones/1.json
  def update
    respond_to do |format|
      if @project_milestone.update(project_milestone_params)
        format.html { redirect_to @project_milestone, notice: 'Project milestone was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_milestone }
      else
        format.html { render :edit }
        format.json { render json: @project_milestone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_milestones/1
  # DELETE /project_milestones/1.json
  def destroy
    @project_milestone.destroy
    respond_to do |format|
      format.html { redirect_to project_milestones_url, notice: 'Project milestone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_milestone
      @project_milestone = ProjectMilestone.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_milestone_params
      params.require(:project_milestone).permit(:name, :description, :expences, :project_id, :created_by, :updated_by, translations_attributes: [:id, :locale, :name, :description])
    end
end
