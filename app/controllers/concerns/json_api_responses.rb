# frozen_string_literal: true

module JsonApiResponses
  include ActiveSupport::Concern

  protected

  def render_error(status:, title:, detail: nil)
    response = {
      errors: [
        {
          status: status.to_s,
          title: title
        }
      ]
    }
    response[:errors][0][:detail] = detail if detail
    render json: response, status: status
  end

  def render_success(status: 200, data: {}, links: nil, meta: nil)
    response = { data: data }
    response[:links] = links if links
    response[:meta] = meta if meta

    render json: response, status: status
  end
end
