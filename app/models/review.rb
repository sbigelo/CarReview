class Review < ApplicationRecord
  belongs_to :user
  # belongs_to :car
  has_many :comments
  has_many :users, through: :comments

  validates :content, presence: true
  validates  :title, presence: true
  validates :content, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }

  scope :abc, -> {order(:title)}
  scope :most_comments, -> {left_outer_joins(:comments).group('reviews.id').order('count(reviews.id) desc')}


end
