module Api
  module V1
    class LocationsController < Api::V1::BaseController
      def show
        location = Location.find(params[:id])
        options = {
          include: [:gps_location, :trivia]
        }
        render json: LocationSerializer.new(location, options).serializable_hash
      end
    end
  end
end
