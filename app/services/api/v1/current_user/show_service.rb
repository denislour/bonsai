# frozen_string_literal: true

module Api
  module V1
    module CurrentUser
      class ShowService < Base::OrchestratorService
        def initialize(cookie_token:)
          super()
          @cookie_token = cookie_token
        end

        private

        def execute
          find_session
          assign_current_session

          @session.user
        end

        def find_session
          @session = action(
            Api::Shared::SessionAuthentication::FindActiveSessionService,
            cookie_token: @cookie_token
          )
        end

        def assign_current_session
          action(
            Api::Shared::SessionAuthentication::AssignCurrentSessionService,
            session: @session
          )
        end
      end
    end
  end
end
