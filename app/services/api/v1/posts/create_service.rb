# frozen_string_literal: true

module Api
  module V1
    module Posts
      class CreateService < Base::OrchestratorService
        def initialize(cookie_token:, title:, body:)
          super()
          @cookie_token = cookie_token
          @title = title
          @body = body
        end

        private

        def execute
          authenticate
          create_post

          @post
        end

        def authenticate
          @session = action(
            Api::Shared::SessionAuthentication::FindActiveSessionService,
            cookie_token: @cookie_token
          )

          @user = @session.user
        end

        def create_post
          @post = Post.create!(title: @title, body: @body, user: @user)
        end
      end
    end
  end
end
