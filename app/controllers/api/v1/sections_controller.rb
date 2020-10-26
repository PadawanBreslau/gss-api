module Api
  module V1
    class SectionsController < Api::V1::BaseController
      def index
        sections = Section.where(variation: 0).page(params[:page] || 0)
        options = {
          meta: index_meta_tags(sections),
          include: [:subsections, :trivia, :images]
        }

        render json: SectionSerializer.new(sections, options).serializable_hash
      end

      def show
        section = Section.find(params[:id])
        options = {
          include: [:subsections, :trivia, :images]
        }

        render json: SectionSerializer.new(section, options).serializable_hash
      end
    end
  end
end
