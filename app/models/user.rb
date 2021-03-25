class User < ApplicationRecord
    has_secure_password
    has_many :comments
    has_many :commented_reviews, through: :comments, source: :review
    validates :password, length: { in: 6..20 }
    has_many :reviews
    # has_many :cars, through: :reviews
    validates :username, :email, uniqueness: true, presence: true
    validates :username, length: { in: 6..20 }

end
