
module Api
  module V1
    class CurrentUsersController < Api::BaseController
      def show
        service = Api::V1::CurrentUser::ShowService.call(
          cookie_token: cookies.signed[:session_id]
        )

        return service_failure(service) if service.failure?

        @user = service.result
      end
    end
  end
end
