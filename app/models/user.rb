class User < ApplicationRecord
    has_secure_password
    has_many :comments
    has_many :commented_reviews, through: :comments, source: :review

    has_many :reviews
    # has_many :cars, through: :reviews
    validates :username, :email, presence: true

end
