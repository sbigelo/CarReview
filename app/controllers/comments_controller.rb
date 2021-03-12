class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        if params[:post_id] && @post = Post.find_by_id(:post_id)
            @comments = @post.comments
        else
        @comments = Comment.all
        end
    end

    def new
        @comment = Comment.new
    end

    def create
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            redirect_to comments_path
        else
            redner :new
        end
    end

    def show
        
    end

    def edit
        
    end





end
