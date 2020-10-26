module Api
  module V1
    class SectionsController < Api::V1::BaseController
      before_action :authenticate_api_v1_person!, only: []

      def index
        sections = Section.where(variation: 0)
        options = { meta: index_meta_tags(sections) }

        render json: SectionsSerializer.new(sections, options).serializable_hash
      end

      def show
        section = Section.find(params[:id])

        render json: SectionsSerializer.new(section).serializable_hash
      end
    end
  end
end
