# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApiController
      def index
        @user = User.where(:role => 0)
        render json: @user
      end
    end
  end
end