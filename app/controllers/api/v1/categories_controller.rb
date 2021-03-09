# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < ApiController
      def index
        @category = Category.all
        render json: @category
      end
    end
  end
end
