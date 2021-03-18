class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in
    

    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @review = @user.reviews.build
        else
            @review = Review.new
        end
    end

    def create
        @review = current_user.reviews.build(review_params) 
        if @review.save
            redirect_to reviews_path
        else
            render :new
        end
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
        @review = Review.find_by_id(params[:id])
        redirect_to reviews_path if !@review
    end

    def destroy
     @review = Review.find(params[:id])
     @review.destroy
         session.delete(:user_id)
    end




    private

    def review_params
        params.require(:review).permit(:title, :content)
    end

end
