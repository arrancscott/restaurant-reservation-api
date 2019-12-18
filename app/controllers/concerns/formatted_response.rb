# frozen_string_literal: true

module FormattedResponse
  extend ActiveSupport::Concern

  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
