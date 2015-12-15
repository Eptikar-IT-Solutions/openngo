require 'icalendar'
module Api
  module V1
    class ProjectsController < ApplicationController
      respond_to :json 
      
      def index
        respond_with Project.all
      end
      
      def show
        @project = Project.find(params[:id])
        render :show
     end
      
      def create
        respond_with Project.create(params[:project])
      end
      
      def update
        respond_with Project.update(params[:id], params[:projects])
      end
      
      def destroy
        respond_with Project.destroy(params[:id])
      end
    end
  end
end