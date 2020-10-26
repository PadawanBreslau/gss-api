# frozen_string_literal: true

module DeviseTokenAuthResponses
  include ActiveSupport::Concern

  protected

  def render_devise_error(status:, title:, detail: nil)
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

  def render_devise_success(status:, data: {}, message: nil)
    response = {
      data: data
    }
    response[:meta] = { message: message } if message
    render json: response, status: status
  end
end
