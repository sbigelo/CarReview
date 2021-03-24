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

    def edit
        @review = Review.find(params[:id])
        redirect_to reviews_path if !@review || @review.user != current_user
    end

    def update
        @review = Review.find_by_id(params[:id])
        redirect_to reviews_path if !@review || @review.user != current_user
        if @review.update(review_params)
            redirect_to review_path(@review)
        else
            render :edit
        end
    end

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @reviews = @user.reviews.abc
        else
            @reviews = Review.most_comments
        end
    end

    def show
        @review = Review.find_by_id(params[:id])
        if !@review
            flash[:error] = "That review does not exist."
            redirect_to reviews_path
        end
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
