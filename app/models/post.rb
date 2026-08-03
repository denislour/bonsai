# frozen_string_literal: true

class Post < ApplicationRecord
  has_paper_trail             # Theo dõi mọi thay đổi bài viết → ghi vào bảng versions.

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
end
