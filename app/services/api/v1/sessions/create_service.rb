# frozen_string_literal: true

module Api
  module V1
    module Sessions
      class CreateService < Base::OrchestratorService
        class InvalidCredentialsError < StandardError; end

        def initialize(email_address:, password:, ip_address:, user_agent:, cookie_jar:)
          super()
          @email_address = email_address.to_s.strip.downcase
          @password = password.to_s
          @ip_address = ip_address
          @user_agent = user_agent
          @cookie_jar = cookie_jar
        end

        private

        def execute
          authenticate
          persist_session
          assign_current_session
          write_cookie

          @user
        end

        def authenticate
          @user = User.find_by(email_address: @email_address)

          raise InvalidCredentialsError unless @user&.authenticate(@password)
        end

        def persist_session
          @cookie_token = SecureRandom.urlsafe_base64(32)

          @session = Session.create!(
            user: @user,
            token_digest: Digest::SHA256.hexdigest(@cookie_token),
            ip_address: @ip_address,
            user_agent: @user_agent
          )
        end

        def assign_current_session
          action(
            Api::Shared::SessionAuthentication::AssignCurrentSessionService,
            session: @session
          )
        end

        def write_cookie
          @cookie_jar.signed.permanent[:session_id] = {
            value: @cookie_token,
            httponly: true,
            same_site: :lax
          }
        end
      end
    end
  end
end
