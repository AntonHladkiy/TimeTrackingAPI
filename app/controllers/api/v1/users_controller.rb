# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApiController
      def index
        @user = User.all
        render json: @user
      end
    end
  end
end