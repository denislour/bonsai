# frozen_string_literal: true

module Api
  module V1
    module Comments
      class CreateService < Base::OrchestratorService
        def initialize(cookie_token:, post_id:, body:)
          super()
          @cookie_token = cookie_token
          @post_id = post_id
          @body = body
        end

        private

        def execute
          authenticate
          find_post
          create_comment

          @comment
        end

        def authenticate
          @session = action(
            Api::Shared::SessionAuthentication::FindActiveSessionService,
            cookie_token: @cookie_token
          )

          @user = @session.user
        end

        def find_post
          @post = Post.find(@post_id)
        end

        def create_comment
          @comment = @post.comments.create!(body: @body, user: @user)
        end
      end
    end
  end
end
