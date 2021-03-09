# frozen_string_literal: true

module Api
  module V1
    class ProjectsController < ApiController
      def index
        @project = Project.all
        render json: @project
      end
    end
  end
end
