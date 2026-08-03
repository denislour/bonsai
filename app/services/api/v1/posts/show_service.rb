# frozen_string_literal: true

module Api
  module V1
    module Posts
      class ShowService < Base::OrchestratorService
        def initialize(id:)
          super()
          @id = id
        end

        private

        def execute
          find_post

          @post
        end

        def find_post
          @post = Post.includes(:user, :comments).find(@id)
        end
      end
    end
  end
end
