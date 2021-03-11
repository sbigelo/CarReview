class User < ApplicationRecord
    has_many :comments
    has_many :commented_reviews, through: :comments

    has_many :reviews
    # has_many :cars, through: :reviews
end
