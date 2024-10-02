class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author

  validates :content, presence: true
  validates :date, presence: true
end
