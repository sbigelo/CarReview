class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in
    

    def new
        if find_params
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

    def edit
        @review = Review.find(params[:id])
        redirect_if_not_current_user
    end

    def update
        find_review
        redirect_if_not_current_user
        if @review.update(review_params)
            redirect_to review_path(@review)
        else
            render :edit
        end
    end

    def index
        if find_params
            @reviews = @user.reviews
        else
            @reviews = Review.top_comments
        end
    end

    def show
        find_review
        if !@review
            redirect_to reviews_path, flash: {error: "That review does not exist."}
        end
    end


    private

    def review_params
        params.require(:review).permit(:title, :content)
    end

    def find_params
        params[:user_id] && @user = User.find_by_id(params[:user_id])
    end

    def redirect_if_not_current_user
        redirect_to reviews_path if !@review || @review.user != current_user
    end

    def find_review
        @review = Review.find_by_id(params[:id])
    end

end
