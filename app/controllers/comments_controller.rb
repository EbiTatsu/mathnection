class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.save
  end


  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, question_id: params[:question_id])
  end
end
