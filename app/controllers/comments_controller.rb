class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_comment, only: [:show, :edit, :update]
    before_action :redirect_if_not_comment_author, only: [:edit, :update]
    
    def index
        if review_find_by
            @comments = @review.comments
        else
            review_doesnt_exist
            @comments = Comment.comment_created_at_order
        end
    end

    def new
        if review_find_by
             @comment = @review.comments.build
        else
            review_doesnt_exist
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
        @comment = Comment.find_by(id: params[:id])
        if !@comment || !@comment.user == current_user
            redirect_to comments_path, flash: {error: "Comment was not found"}
        end
    end

    def review_find_by
        params[:review_id] && @review = Review.find_by_id(params[:review_id])
    end

    def redirect_if_not_comment_author
        redirect_to comments_path, flash: {error: "You must be the creator of the comment to do that."} if @comment.user != current_user
    end

    def review_doesnt_exist
        @error = "That review does not exist." if params[:review_id]
    end

end
