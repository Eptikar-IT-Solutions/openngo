module Stampable
  extend ActiveSupport::Concern

  included do
    before_filter :stamp_created_by, only: :create
    before_filter :stamp_updated_by, only: :update
  end

  def stamp_created_by
    params[params[:controller].singularize.downcase.to_sym].merge!(:created_by => current_user.id.to_s, :updated_by => current_user.id.to_s) if params[params[:controller].singularize.downcase.to_sym]
  end

  def stamp_updated_by
    params[params[:controller].singularize.downcase.to_sym].merge!(:updated_by => current_user.id.to_s) if params[params[:controller].singularize.downcase.to_sym]
  end
end