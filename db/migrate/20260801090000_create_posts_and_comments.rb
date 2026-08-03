# frozen_string_literal: true

class CreatePostsAndComments < ActiveRecord::Migration[8.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end

    create_table :comments do |t|
      t.text :body, null: false
      t.references :post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
