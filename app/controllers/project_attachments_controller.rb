class ProjectAttachmentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_project_attachment, only: [:show, :edit, :update, :destroy]

  # GET /project_attachments
  # GET /project_attachments.json
  def index
    @project_attachments = ProjectAttachment.all
  end

  # GET /project_attachments/1
  # GET /project_attachments/1.json
  def show
  end

  # GET /project_attachments/new
  def new
    @project_attachment = ProjectAttachment.new
  end

  # GET /project_attachments/1/edit
  def edit
  end

  # POST /project_attachments
  # POST /project_attachments.json
  def create
    @project_attachment = ProjectAttachment.new(project_attachment_params)

    respond_to do |format|
      if @project_attachment.save
        format.html { redirect_to @project_attachment, notice: 'Project attachment was successfully created.' }
        format.json { render :show, status: :created, location: @project_attachment }
      else
        format.html { render :new }
        format.json { render json: @project_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_attachments/1
  # PATCH/PUT /project_attachments/1.json
  def update
    respond_to do |format|
      if @project_attachment.update(project_attachment_params)
        format.html { redirect_to @project_attachment, notice: 'Project attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_attachment }
      else
        format.html { render :edit }
        format.json { render json: @project_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_attachments/1
  # DELETE /project_attachments/1.json
  def destroy
    @project_attachment.destroy
    respond_to do |format|
      format.html { redirect_to project_attachments_url, notice: 'Project attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_attachment
      @project_attachment = ProjectAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_attachment_params
      params.require(:project_attachment).permit(:project_id, :attachment [:tempfile, :original_filename, :content_type, :headers], :created_by, :updated_by)
    end
end
