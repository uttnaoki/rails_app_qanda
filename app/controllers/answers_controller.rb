class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to question_path(@question), notice: 'Success!'
    else
      redirect_to question_path(@question), alert: 'Invalid!'
    end
  end
  
  def edit
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    if @answer.update(answer_params)
      redirect_to question_path(@question), notice: 'Success!'
    else
      flash[:alert] = 'Invalid!'
      render :edit
    end
  end
  
  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    if @answer.destroy
      redirect_to question_path(@question), notice: 'Deleted!'
    else
      flash[:alert] = 'Failed!'
      render :edit
    end
  end
  
  private
    def answer_params
      params.require(:answer).permit(:question_id, :name, :content)
    end
end
