module Api
  module V1
    class UtilitiesController < Api::V1::BaseController
      def show
        subsection = Utility.find(params[:id])
        options = {
          include: [:gps_location]
        }

        render json: UtilitySerializer.new(subsection, options).serializable_hash
      end
    end
  end
end
