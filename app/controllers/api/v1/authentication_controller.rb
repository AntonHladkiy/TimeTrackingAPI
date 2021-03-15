# frozen_string_literal: true

module Api
  module V1
    class AuthenticationController < ApiController
      skip_before_action :authenticate_user!, only: [:create]
      def create
        user = User.find_by(email: params[:email])
        if user&.valid_password?(params[:password])
          render json: { token: JsonWebToken.encode(sub: user.id),user: user}
        else
          render json: { errors: 'invalid' },status:401
        end
      end
    end
  end
end
