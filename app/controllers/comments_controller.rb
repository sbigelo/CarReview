class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_comment, only: [:show, :edit, :update]
    def index
        if params[:review_id] && @review = Review.find_by_id(params[:review_id])
            @comments = @review.comments
        else
            @error = "That review does not exist." if params[:review_id]
            @comments = Comment.all
        end
    end

    def new
        if params[:review_id] && @review = Review.find_by_id(params[:review_id])
             @comment = @review.comments.build
        else
            @error = "That review does not exist." if params[:review_id]
            @comment = Comment.new
        end
    end

    def create
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            redirect_to comments_path
        else
            render :new
        end
    end

    def show
        @comment = Comment.find_by_id(params[:id])
    end

    def edit
       
    end

    def update
        if @comment.update(comment_params)
            redirect_to comment_path(@comment)
        else
            render :edit
        end
    end


    private

    def comment_params
        params.require(:comment).permit(:content, :review_id)
    end

    def set_comment
        @comment = Comment.find_by_id(params[:id])
        if !@comment
            flash[:message] = "Comment was not found"
            # redirect_to comments_path
        end
    end

    




end
