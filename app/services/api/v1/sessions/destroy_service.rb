# frozen_string_literal: true

module Api
  module V1
    module Sessions
      class DestroyService < Base::OrchestratorService
        def initialize(cookie_token:, cookie_jar:)
          super()
          @cookie_token = cookie_token
          @cookie_jar = cookie_jar
        end

        private

        def execute
          find_session
          revoke_session
          delete_cookie
          clear_current

          true
        end

        def find_session
          @session = action(
            Api::Shared::SessionAuthentication::FindActiveSessionService,
            cookie_token: @cookie_token
          )
        end

        def revoke_session
          @session.destroy!
        end

        def delete_cookie
          @cookie_jar.delete(:session_id)
        end

        def clear_current
          action(
            Api::Shared::SessionAuthentication::AssignCurrentSessionService,
            session: nil
          )
        end
      end
    end
  end
end
