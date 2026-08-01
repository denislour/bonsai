# frozen_string_literal: true

module Api
  module Shared
    module SessionAuthentication
      class FindActiveSessionService < Base::ActionService
        class UnauthorizedError < StandardError; end

        def initialize(cookie_token:)
          super()
          @cookie_token = cookie_token
        end

        private

        def execute
          raise UnauthorizedError if @cookie_token.blank?

          @session = Session
            .includes(:user)
            .find_by(token_digest: token_digest)

          raise UnauthorizedError unless @session

          @session
        end

        def token_digest
          Digest::SHA256.hexdigest(@cookie_token)
        end
      end
    end
  end
end
