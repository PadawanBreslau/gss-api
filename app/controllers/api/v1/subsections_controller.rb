module Api
  module V1
    class SubsectionsController < Api::V1::BaseController
      def show
        subsection = Subsection.find(params[:id])
        options = {
          include: [:locations, :utilities, :trivia, :images]
        }

        render json: SubsectionSerializer.new(subsection, options).serializable_hash
      end
    end
  end
end