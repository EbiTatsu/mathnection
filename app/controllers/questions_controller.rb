class QuestionsController < ApplicationController

  def index
    @questions = Question.includes(:user)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    # @user = User.new
    # @user = @question.user
    if @question.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end



  private
  def question_params
    params.require(:question).permit(:title, :overview, :image).merge(user_id: current_user.id)
  end

end
