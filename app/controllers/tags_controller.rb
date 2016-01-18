class TagsController < ApplicationController

  before_action :set_tag, only: [:show, :update]

  def show
  end

  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to @tag, notice: t('controllers.tags.Setting was successfully updated.') }
        format.json { render :show, status: :ok, location: @tag }
      end
    end
  end

  private
    def set_tag
      @tag = Tag.find(params[:id])
    end

    def tag_params
      params.require(:tag).permit(:color_code, :created_by, :updated_by)
    end
end
