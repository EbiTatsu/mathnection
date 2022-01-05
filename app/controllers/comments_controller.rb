class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to question_path(@comment.question)
    else
      @prototype = @comment.question
      @comments = @question.comments
      render "question/show"
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, question_id: params[:question_id])
  end
end
