# frozen_string_literal: true

# Thêm cột object_changes — lưu diff field thay đổi khi update.
class AddObjectChangesToVersions < ActiveRecord::Migration[8.1]
  def change
    add_column :versions, :object_changes, :text
  end
end
