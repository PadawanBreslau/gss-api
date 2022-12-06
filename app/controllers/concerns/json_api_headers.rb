# frozen_string_literal: true

module JsonApiHeaders
  extend ActiveSupport::Concern

  included do
    #before_action :set_headers, :check_headers
  end

  protected

  def set_headers
    response.headers['Content-Type'] = 'application/vnd.api+json'
  end

  def check_headers
    if request.headers['Content-Type'] != 'application/vnd.api+json'
      render json: { errors: [{ status: '415', title: 'Unsupported Media Type' }] }, status: 415
    elsif request.headers['Accept'] != 'application/vnd.api+json'
      render json: { errors: [{ status: '406', title: 'Not Acceptable' }] }, status: 406
    end
  end
end
