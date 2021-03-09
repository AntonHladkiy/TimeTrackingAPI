# frozen_string_literal: true

module Api
  module V1
    class ActivitiesController < ApiController
      def index
        if user.admin?
          @activity = Activity.all
        elsif user.developer?
          @activity = current_user.activities
        end
        render json: @activity
      end

      def create
        @activity = current_user.activities.create(activity_params)
        @activity.date=Time.today
        if @activity.save
          render json: @activity, status: :created
        else
          render json: @activity.errors, status: :unprocessable_entity
        end
      end

      def update
        @activity = Activity.find(params[:id])
        if @activity.update(activity_params)
          render json: @activity
        else
          render json: @activity.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @activity = Activity.find(params[:id])
        @activity.destroy
      end

      private

      def activity_params
        params
          .require(:activity)
          .permit(:project, :category, :name, :hours)
      end
    end
  end
end
