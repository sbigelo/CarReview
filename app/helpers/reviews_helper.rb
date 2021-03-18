module ReviewsHelper

    def show_reviews
        if @user.reviews.empty?
            content_tag(:h1, "No Reviews have been made yet.")
        elsif @user == current_user
            content_tag(:h1, "Welcome, #{@user.username}! Here are your reviews: ")
        else
            content_tag(:h1, "Here are #{@user.username}'s reviews:")
        end
    end

end


