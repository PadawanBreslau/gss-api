# frozen_string_literal: true

module Api
  class BaseController < ActionController::API
    include JsonApiHeaders
    include JsonApiResponses

    rescue_from ActiveRecord::RecordNotFound, with: :not_found_error

    def pagination_dict(collection)
      {
        current_page: collection.current_page,
        next_page: collection.next_page,
        prev_page: collection.prev_page,
        total_pages: collection.total_pages,
        total_count: collection.total_count,
        page_size: collection.per_page
      }
    end

    private

    def not_found_error
      render_error(status: 404,
                   title: 'Record not found.')
    end

    def not_authorized_error
      render_error(status: 403,
                   title: 'Forbidden Access.')
    end
  end
end
