# frozen_string_literal: true

# Format giá trị trước khi render — Time thành ISO8601, còn lại nguyên.
format_value = ->(value) { value.respond_to?(:iso8601) ? value.iso8601 : value }

# Danh sách version log.
json.array! @versions do |version|
  json.id version.id
  json.item_type version.item_type       # Model bị thay đổi (Post/Comment).
  json.item_id version.item_id           # Record bị thay đổi.
  json.event version.event               # create / update / destroy.
  json.user_id version.whodunnit         # Ai thực hiện.
  json.created_at version.created_at     # Thời điểm.

  # Chi tiết field nào thay đổi — trước/sau.
  json.changes do
    version.changeset.each do |field, values|
      json.set! field do
        json.before format_value.call(values.first)
        json.after format_value.call(values.last)
      end
    end
  end
end
