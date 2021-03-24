class Review < ApplicationRecord
  belongs_to :user
  # belongs_to :car
  has_many :comments
  has_many :users, through: :comments
  validates :content, :title, presence: true

  scope :abc, -> {order(:title)}
  scope :most_comments, -> {left_outer_joins(:comments).group('reviews.id').order('count(reviews.id) desc')}


end
