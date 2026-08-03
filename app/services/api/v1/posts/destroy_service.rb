# frozen_string_literal: true

module Api
  module V1
    module Posts
      class DestroyService < Base::OrchestratorService
        def initialize(cookie_token:, id:)
          super()
          @cookie_token = cookie_token
          @id = id
        end

        private

        def execute
          authenticate
          find_post
          destroy_post

          true
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

        def destroy_post
          @post.destroy!
        end
      end
    end
  end
end
