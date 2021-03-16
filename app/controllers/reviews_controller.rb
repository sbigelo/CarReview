class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in


    def new
        @review = Review.new
    end

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @reviews = @user.reviews
        else
            @error = "That review does not exist." if params[:user_id]
            @reviews = Review.all
        end
    end

    def show
        @review = Review.find(params[:id])
        redirect_to reviews_path if !@review
    end

    def create
        @review = current_user.reviews.build(review_params) 
        if @review.save
            redirect_to reviews_path
        else
            render :new
        end
    end

    def destroy
        Review.find(params[:id]).destroy

    end




    private

    def review_params
        params.require(:review).permit(:title, :content)
    end

end
