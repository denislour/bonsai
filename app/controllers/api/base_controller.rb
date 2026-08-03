# frozen_string_literal: true

module Api
  class BaseController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity

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

    def not_found(exception)
      render json: { error: exception.message }, status: :not_found
    end

    def unprocessable_entity(exception)
      render json: { error: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
