module Api
  module V1
    class SubsectionsController < Api::V1::BaseController
      def show
        subsection = Subsection.find(params[:id])
        options = {
          include: [:locations, :utilities, :trivia, :images],
          params: { trivia: true, images: true }
        }

        render json: SubsectionSerializer.new(subsection, options).serializable_hash
      end
    end
  end
end
