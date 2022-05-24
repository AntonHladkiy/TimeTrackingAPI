# frozen_string_literal: true

module Api
  module V1
    class ActivitiesController < ApiController
      def index
        if current_user.admin?
          @activity = Activity.where(:date => params[:date])
          if(params[:user_id]!='')
            @activity=@activity.where(:user_id=>params[:user_id])
          end
          if(params[:project]!='')
            @activity=@activity.where(:project=>params[:project])
          end
          if(params[:category]!='')
            @activity=@activity.where(:category=>params[:category])
          end

        elsif current_user.developer?
          @activity = current_user.activities.where(:date => params[:date])
        end
        if(params[:page]!='')
          @activity=@activity.offset((params[:page].to_i-1)*10).limit(10)
        end
        render json: @activity
      end

      def create
        @activity = current_user.activities.create(activity_params)
        @activity.name=current_user.firstName
        if @activity.save
          render json: @activity, status: :created
        else
          render json: @activity.errors, status: :unprocessable_entity
        end
      end

      def update
        p params[:activity][:user_id]
        @activity = Activity.find(params[:id])
        @user=User.find(params[:activity][:user_id])
        @activity.name=@user.firstName
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
          .permit(:project, :category,:user_id, :hours,:date)
      end
    end
  end
end
