class MembersController < ApplicationController
  load_and_authorize_resource
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  # GET /members
  # GET /members.json
  def index
    @members = Member.all
  end

  # GET /members/1
  # GET /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
    @genders = Member.genders
  end

  # GET /members/1/edit
  def edit
    @genders = Member.genders
  end

  # POST /members
  # POST /members.json
  def create
    set_member_profession

    @member = Member.new(member_params)
    @genders = Member.genders

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    @genders = Member.genders

    set_member_profession
    
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:name, :gender, :joined_at, :email, :mobile, :address, :profession_id, :other_profession, :education, :branch_id, :role_id, :bio,:avatar, :active, :created_by, :updated_by)
    end

    def set_member_profession
      other_profession_id = Profession.where(name: 'other').take.id
      if member_params['profession_id'].to_i == other_profession_id
        params[:member][:profession_id] = Profession.find_or_create_by(name: member_params['other_profession']).id
      end
    end
end
