class Review < ApplicationRecord
  belongs_to :user
  # belongs_to :car
  has_many :comments
  has_many :users, through: :comments
  validates :content, :title, presence: true

  scope :abc, -> {order(:title)}

end
