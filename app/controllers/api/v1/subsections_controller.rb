module Api
  module V1
    class SubsectionsController < Api::V1::BaseController
      def show
        subsection = Subsection.find(params[:id])
        options = {
          include: [:locations, :trivia]
        }

        render json: SubsectionSerializer.new(subsection, options).serializable_hash
      end
    end
  end
end
