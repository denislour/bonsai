
module Api
  module V1
    class SessionsController < Api::BaseController
      rate_limit to: 10, within: 3.minutes, only: :create,
        with: -> { render json: { error: "Too many requests" }, status: :too_many_requests }

      def create
        service = Api::V1::Sessions::CreateService.call(
          email_address: params[:email_address],
          password: params[:password],
          ip_address: request.remote_ip,
          user_agent: request.user_agent,
          cookie_jar: cookies
        )

        return service_failure(service) if service.failure?

        @user = service.result

        render :create, status: :created
      end

      def destroy
        service = Api::V1::Sessions::DestroyService.call(
          cookie_token: cookies.signed[:session_id],
          cookie_jar: cookies
        )

        return service_failure(service) if service.failure?

        head :no_content
      end
    end
  end
end
