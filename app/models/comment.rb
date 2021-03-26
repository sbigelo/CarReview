class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :review

    validates :content, presence: true
    validates :content, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
    validates :review, uniqueness: {scope: :user_id, message: "comment can only have one comment per person."}

    scope :abc, -> {order(:user)}

end


  