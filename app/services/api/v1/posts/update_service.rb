# frozen_string_literal: true

module Api
  module V1
    module Posts
      class UpdateService < Base::OrchestratorService
        def initialize(cookie_token:, id:, title:, body:)
          super()
          @cookie_token = cookie_token
          @id = id
          @title = title
          @body = body
        end

        private

        def execute
          authenticate
          find_post
          update_post

          @post
        end

        def authenticate
          @session = action(
            Api::Shared::SessionAuthentication::FindActiveSessionService,
            cookie_token: @cookie_token
          )

          @user = @session.user
        end

        def find_post
          @post = Post.find(@id)
        end

        def update_post
          @post.update!(title: @title, body: @body)
        end
      end
    end
  end
end
