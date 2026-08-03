# frozen_string_literal: true

# Thống kê hoạt động.
json.by_user @stats[:by_user]   # [{user_id:, event:, count:}] — user làm bao nhiêu mỗi loại.
json.by_item @stats[:by_item]   # [{item_type:, item_id:, event:, count:}] — record bị sửa bao nhiêu lần.
