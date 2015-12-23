class ProjectPartnersController < ApplicationController
  load_and_authorize_resource
  before_action :set_project_partner, only: [:show, :edit, :update, :destroy]

  # GET /project_partners
  # GET /project_partners.json
  def index
    @project_partners = ProjectPartner.all
  end

  # GET /project_partners/1
  # GET /project_partners/1.json
  def show
  end

  # GET /project_partners/new
  def new
    @project_partner = ProjectPartner.new
  end

  # GET /project_partners/1/edit
  def edit
  end

  # POST /project_partners
  # POST /project_partners.json
  def create
    @project_partner = ProjectPartner.new(project_partner_params)

    respond_to do |format|
      if @project_partner.save
        format.html { redirect_to @project_partner, notice: 'Project partner was successfully created.' }
        format.json { render :show, status: :created, location: @project_partner }
      else
        format.html { render :new }
        format.json { render json: @project_partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_partners/1
  # PATCH/PUT /project_partners/1.json
  def update
    respond_to do |format|
      if @project_partner.update(project_partner_params)
        format.html { redirect_to @project_partner, notice: 'Project partner was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_partner }
      else
        format.html { render :edit }
        format.json { render json: @project_partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_partners/1
  # DELETE /project_partners/1.json
  def destroy
    @project_partner.destroy
    respond_to do |format|
      format.html { redirect_to project_partners_url, notice: 'Project partner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_partner
      @project_partner = ProjectPartner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_partner_params
      params.require(:project_partner).permit(:project_id, :partner_id, :created_by, :updated_by)
    end
end
