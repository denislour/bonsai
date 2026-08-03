# frozen_string_literal: true

module Api
  module V1
    class CommentsController < Api::BaseController
      def create
        service = Api::V1::Comments::CreateService.call(
          cookie_token: cookies.signed[:session_id],
          post_id: params[:post_id],
          body: params[:body]
        )

        return service_failure(service) if service.failure?

        @comment = service.result
        render :create, status: :created
      end
    end
  end
end
