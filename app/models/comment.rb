# frozen_string_literal: true

class Comment < ApplicationRecord
  has_paper_trail             # Theo dõi mọi thay đổi bình luận → ghi vào bảng versions.

  belongs_to :post
  belongs_to :user

  validates :body, presence: true
end
