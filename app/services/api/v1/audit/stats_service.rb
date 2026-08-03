# frozen_string_literal: true

module Api
  module V1
    module Audit
      # Service thống kê hoạt động (chỉ đọc).
      # by_user: mỗi user làm bao nhiêu create/update/destroy.
      # by_item: mỗi record bị thay đổi bao nhiêu lần, bởi ai.
      #
      # === Endpoint ===
      #   GET /api/v1/audit/stats
      #
      # === Params (đều optional) ===
      #   item_type : "Post" | "Comment"
      #   item_id   : 1
      #   user_id   : 1
      #
      # === Ví dụ request ===
      #   GET /api/v1/audit/stats?user_id=1
      #
      # === Ví dụ response ===
      #   {
      #     "by_user": [
      #       { "user_id": "1", "event": "create", "count": 2 },
      #       { "user_id": "1", "event": "update", "count": 2 }
      #     ],
      #     "by_item": [
      #       { "item_type": "Post", "item_id": 1, "event": "update", "count": 2 },
      #       { "item_type": "Post", "item_id": 2, "event": "create", "count": 1 }
      #     ]
      #   }
      #
      # === Đọc kết quả ===
      #   by_user → "user 1 đã create 2 bài, update 2 lần"
      #   by_item → "post 1 bị update 2 lần, post 2 create 1 lần"
      class StatsService < Base::OrchestratorService
        def initialize(cookie_token:, item_type: nil, item_id: nil, user_id: nil)
          super()
          @cookie_token = cookie_token
          @item_type = item_type
          @item_id = item_id
          @user_id = user_id
        end

        private

        def execute
          authenticate
          load_stats

          @stats
        end

        def authenticate
          @session = action(
            Api::Shared::SessionAuthentication::FindActiveSessionService,
            cookie_token: @cookie_token
          )

          @user = @session.user
        end

        def load_stats
          base = PaperTrail::Version.all
          base = base.where(item_type: @item_type) if @item_type.present?
          base = base.where(item_id: @item_id) if @item_id.present?
          base = base.where(whodunnit: @user_id.to_s) if @user_id.present?

          @stats = {
            by_user: group_counts(base.group(:whodunnit, :event)),
            by_item: group_counts(base.group(:item_type, :item_id, :event))
          }
        end

        # (whodunnit, event) → {user_id:, event:, count:}
        # (item_type, item_id, event) → {item_type:, item_id:, event:, count:}
        def group_counts(groups)
          groups.count.map do |keys, count|
            if keys.length == 3
              { item_type: keys[0], item_id: keys[1], event: keys[2], count: count }
            else
              { user_id: keys[0], event: keys[1], count: count }
            end
          end
        end
      end
    end
  end
end
