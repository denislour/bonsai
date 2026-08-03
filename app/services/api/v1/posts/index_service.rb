# frozen_string_literal: true

module Api
  module V1
    module Posts
      class IndexService < Base::OrchestratorService
        private

        def execute
          load_posts

          @posts
        end

        def load_posts
          @posts = Post.includes(:user).order(created_at: :desc)
        end
      end
    end
  end
end
