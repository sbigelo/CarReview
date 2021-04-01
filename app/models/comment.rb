class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :review

    validates :content, presence: true, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
    validates :review, uniqueness: {scope: :user_id, message: "comment can only have one comment per person."}

    scope :comment_created_at_order, -> {order(:created_at, :desc)}

end


  