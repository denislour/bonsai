class Post < ApplicationRecord
  belongs_to :author
  has_many :comments
  has_and_belongs_to_many :tags

  validates :title, presence: true
  validates :excerpt, presence: true
  validates :content, presence: true
  validates :date, presence: true
  validates :image, presence: true
end
