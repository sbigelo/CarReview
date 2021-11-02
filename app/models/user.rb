class User < ApplicationRecord
    has_secure_password
    has_many :comments
    has_many :commented_reviews, through: :comments, source: :review
    has_many :reviews
    
    validates :username, :email, uniqueness: true, presence: true
    

end
