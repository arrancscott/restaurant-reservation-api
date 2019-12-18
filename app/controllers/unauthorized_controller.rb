# frozen_string_literal: true

class UnauthorizedController < ActionController::API
  include FormattedResponse

  def show
    json_response({ message: 'You are not authorized to make this API call.', status: 401 }, 401)
  end
end
