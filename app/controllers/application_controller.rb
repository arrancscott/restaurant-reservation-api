# frozen_string_literal: true

class ApplicationController < ActionController::API
  include CanCan::ControllerAdditions
  include FormattedResponse

  check_authorization

  acts_as_token_authentication_handler_for User

  rescue_from CanCan::AccessDenied do
    json_response({
                    message: "You don't have the correct permissions in order to access this endpoint.",
                    status: 401
                  }, 401)
  end
end
