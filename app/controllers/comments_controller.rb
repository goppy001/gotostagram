class CommentsController < ApplicationController
  before_action :logged_in_user

  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment   = @micropost.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      render :create
      flash.now[:success] = "コメントを投稿しました"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
     render :destroy
    end
  end


  private
    
    def comment_params
      params.require(:comment).permit(:body, :micropost_id, :user_id)
    end
end
