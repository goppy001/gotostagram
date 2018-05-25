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
    @micropost = Comment.find(params[:id]).micropost
    @comment   = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html {redirect_to micropost_path}
      format.js
    end
  end


  private
    
    def comment_params
      params.require(:comment).permit(:body, :micropost_id, :user_id)
    end
end
