module Api
  module V1
    class SectionsController < Api::V1::BaseController
      def index
        sections = Section.includes([:subsections,
                                     :locations,
                                     :utilities,
                                     :images,
                                     :trivia])
        options = {
          include: [:subsections, :locations, :utilities]
        }

        render json: SectionSerializer.new(sections, options).serializable_hash
      end

      def show
        section = Section.find(params[:id])
        options = {
          include: [:subsections, :locations, :utilities, :images, :trivia]
        }

        render json: SectionSerializer.new(section, options).serializable_hash
      end
    end
  end
end
