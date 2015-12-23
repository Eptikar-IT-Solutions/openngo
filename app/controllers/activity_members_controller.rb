class ActivityMembersController < ApplicationController
  load_and_authorize_resource
  before_action :set_activity_member, only: [:show, :edit, :update, :destroy]

  # GET /activity_members
  # GET /activity_members.json
  def index
    @activity_members = ActivityMember.all
  end

  # GET /activity_members/1
  # GET /activity_members/1.json
  def show
  end

  # GET /activity_members/new
  def new
    @activity_member = ActivityMember.new
  end

  # GET /activity_members/1/edit
  def edit
  end

  # POST /activity_members
  # POST /activity_members.json
  def create
    @activity_member = ActivityMember.new(activity_member_params)

    respond_to do |format|
      if @activity_member.save
        format.html { redirect_to @activity_member, notice: 'Activity member was successfully created.' }
        format.json { render :show, status: :created, location: @activity_member }
      else
        format.html { render :new }
        format.json { render json: @activity_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_members/1
  # PATCH/PUT /activity_members/1.json
  def update
    respond_to do |format|
      if @activity_member.update(activity_member_params)
        format.html { redirect_to @activity_member, notice: 'Activity member was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity_member }
      else
        format.html { render :edit }
        format.json { render json: @activity_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_members/1
  # DELETE /activity_members/1.json
  def destroy
    @activity_member.destroy
    respond_to do |format|
      format.html { redirect_to activity_members_url, notice: 'Activity member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_member
      @activity_member = ActivityMember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_member_params
      params.require(:activity_member).permit(:activity_id, :member_id, :role_id, :created_by, :updated_by)
    end
end
