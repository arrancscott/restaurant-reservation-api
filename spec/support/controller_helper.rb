# frozen_string_literal: true

module Requests
  module ControllerHelpers
    def json
      JSON.parse(response.body)
    end

    def set_auth_headers
      user = create(:user)
      request.headers.merge!('X-User-Email' => user.email, 'X-User-Token' => user.authentication_token)
    end
  end
end
