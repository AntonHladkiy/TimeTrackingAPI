# frozen_string_literal: true

module Api
  module V1
    class ActivitiesController < ApiController
      def index
        if current_user.admin?
          @activity = Activity.all
        elsif current_user.developer?
          @activity = current_user.activities
        end
        render json: @activity
      end

      def create
        @activity = current_user.activities.create(activity_params)
        if @activity.save
          render json: @activity, status: :created
        else
          render json: @activity.errors, status: :unprocessable_entity
        end
      end

      def update
        @activity = Activity.find(params[:id])
        @user=User.find_by(firstName: activity_params[:name])
        @activity.user_id=@user.id
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
          .permit(:project, :category, :name, :hours,:date)
      end
    end
  end
end
