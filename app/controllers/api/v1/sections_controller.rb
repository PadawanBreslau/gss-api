module Api
  module V1
    class SectionsController < Api::V1::BaseController
      def index
        sections = Section.main.includes(:images)
        render json: SectionSerializer.new(sections).serializable_hash
      end

      def show
        section = Section.find(params[:id])
        render json: SectionSerializer.new(section).serializable_hash
      end
    end
  end
end
