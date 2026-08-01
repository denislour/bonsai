
module Api
  class BaseController < ApplicationController
    private

    def service_failure(service)
      case service.error
      when Api::V1::Sessions::CreateService::InvalidCredentialsError,
           Api::Shared::SessionAuthentication::FindActiveSessionService::UnauthorizedError
        head :unauthorized
      else
        raise service.error
      end
    end
  end
end
