# frozen_string_literal: true

module Api
  module V1
    class BaseController < Api::BaseController
      include JsonApiHeaders

      def health_check
        render json: {}, status: 200
      end

      private

      def index_meta_tags(collection)
        {
          current_page: collection.current_page,
          next_page: collection.next_page,
          prev_page: collection.prev_page,
          total_pages: collection.total_pages,
          total_count: collection.total_count,
          page_size: collection.limit_value
        }
      end

      def jsonapi_params
        params.from_jsonapi.require(:data).require(:attributes)
      end
    end
  end
end
