# frozen_string_literal: true

module Api
  module V1
    # Controller audit log — chỉ đọc (Read).
    class AuditController < Api::BaseController
      # Danh sách version với filter + search.
      def versions
        service = Api::V1::Audit::VersionsService.call(
          cookie_token: cookies.signed[:session_id],
          item_type: params[:item_type],
          item_id: params[:item_id],
          user_id: params[:user_id],
          event: params[:event],
          search: params[:search],
          limit: params[:limit]
        )

        return service_failure(service) if service.failure?

        @versions = service.result
        render :versions
      end

      # Thống kê hoạt động theo user / theo record.
      def stats
        service = Api::V1::Audit::StatsService.call(
          cookie_token: cookies.signed[:session_id],
          item_type: params[:item_type],
          item_id: params[:item_id],
          user_id: params[:user_id]
        )

        return service_failure(service) if service.failure?

        @stats = service.result
        render :stats
      end
    end
  end
end
