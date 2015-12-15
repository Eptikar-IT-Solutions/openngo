module Api
  module V1
    class ActivitiesController < ApplicationController

      include ActionController::MimeResponds
   
      def index
        calendar = Icalendar::Calendar.new
        @activities = Activity.all
        @activities.each do |activity|
         calendar.add_event(activity.to_ics)
        end

        respond_to do |format|
          format.ics { render text: calendar.to_ical }
          format.csv { render text: @activities.to_csv}
        end
      end
      
      def show
        @activity = Activity.find(params[:id])
      end

    end
  end
end