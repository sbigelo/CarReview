module ReviewsHelper

    def show_reviews
        if @user.reviews.empty?
            content_tag(:h1, "No Reviews have been made by #{@user.username} yet.")
        elsif @user == current_user
            content_tag(:h1, "Welcome, #{@user.username}! Here are your reviews: ")
        else
            content_tag(:h1, "Here are #{@user.username}'s reviews:")
        end
    end

    def index_head
        if @user == current_user
            content_tag(:h1, "Here are your Reviews:")
        else
            content_tag(:h1, "All Reviews")
      end
    end

end


