# frozen_string_literal: true

module Api
  module V1
    class PostsController < Api::BaseController
      def index
        service = Api::V1::Posts::IndexService.call

        return service_failure(service) if service.failure?

        @posts = service.result
        render :index
      end

      def show
        service = Api::V1::Posts::ShowService.call(id: params[:id])

        return service_failure(service) if service.failure?

        @post = service.result
        render :show
      end

      def create
        service = Api::V1::Posts::CreateService.call(
          cookie_token: cookies.signed[:session_id],
          title: params[:title],
          body: params[:body]
        )

        return service_failure(service) if service.failure?

        @post = service.result
        render :show, status: :created
      end

      def update
        service = Api::V1::Posts::UpdateService.call(
          cookie_token: cookies.signed[:session_id],
          id: params[:id],
          title: params[:title],
          body: params[:body]
        )

        return service_failure(service) if service.failure?

        @post = service.result
        render :show, status: :ok
      end

      def destroy
        service = Api::V1::Posts::DestroyService.call(
          cookie_token: cookies.signed[:session_id],
          id: params[:id]
        )

        return service_failure(service) if service.failure?

        head :no_content
      end
    end
  end
end
