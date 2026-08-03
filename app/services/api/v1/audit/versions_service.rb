# frozen_string_literal: true

module Api
  module V1
    module Audit
      # Service liệt kê + lọc + tìm kiếm version log (chỉ đọc).
      #
      # === Endpoint ===
      #   GET /api/v1/audit/versions
      #
      # === Params (đều optional) ===
      #   item_type : "Post" | "Comment"   — model nào
      #   item_id   : 1                    — record nào
      #   user_id   : 1                    — ai thực hiện
      #   event     : create|update|destroy
      #   search    : "gia"                — tìm trong nội dung (object + object_changes)
      #   limit     : 50                   — số dòng tối đa (mặc định 50)
      #
      # === Ví dụ request ===
      #   GET /api/v1/audit/versions?item_type=Post&item_id=1
      #
      # === Ví dụ response ===
      #   [
      #     {
      #       "id": 4,
      #       "item_type": "Post",
      #       "item_id": 1,
      #       "event": "update",
      #       "user_id": "1",
      #       "created_at": "2026-08-03T16:09:53.209Z",
      #       "changes": {
      #         "title": { "before": "Bai 1 da sua", "after": "Bai 1 sua lai" }
      #       }
      #     },
      #     {
      #       "id": 1,
      #       "item_type": "Post",
      #       "item_id": 1,
      #       "event": "create",
      #       "user_id": "1",
      #       "created_at": "2026-08-03T16:09:52Z",
      #       "changes": {
      #         "id": { "before": null, "after": 1 },
      #         "title": { "before": null, "after": "Bai dau tien" },
      #         "body": { "before": null, "after": "Noi dung 1" }
      #       }
      #     }
      #   ]
      class VersionsService < Base::OrchestratorService
        def initialize(cookie_token:, item_type: nil, item_id: nil, user_id: nil, event: nil, search: nil, limit: nil)
          super()
          @cookie_token = cookie_token
          @item_type = item_type
          @item_id = item_id
          @user_id = user_id
          @event = event
          @search = search
          @limit = limit
        end

        private

        def execute
          authenticate
          load_versions

          @versions
        end

        # Audit nhạy cảm — bắt buộc đăng nhập.
        def authenticate
          @session = action(
            Api::Shared::SessionAuthentication::FindActiveSessionService,
            cookie_token: @cookie_token
          )

          @user = @session.user
        end

        # Xây query dần theo từng filter có giá trị.
        def load_versions
          scope = PaperTrail::Version.order(created_at: :desc)
          scope = scope.where(item_type: @item_type) if @item_type.present?
          scope = scope.where(item_id: @item_id) if @item_id.present?
          scope = scope.where(whodunnit: @user_id.to_s) if @user_id.present?
          scope = scope.where(event: @event) if @event.present?

          # Search quét cả 2 cột:
          # - object_changes: create version (v17 không lưu object khi create)
          # - object: update/destroy version (trạng thái trước).
          scope = scope.where("object LIKE ? OR object_changes LIKE ?", "%#{@search}%", "%#{@search}%") if @search.present?

          @versions = scope.limit(@limit.presence || 50)
        end
      end
    end
  end
end
