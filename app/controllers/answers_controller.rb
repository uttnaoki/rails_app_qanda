class AnswersController < ApplicationController
  before_action :set_answer, only: [:edit, :update, :destroy]

  def create
    set_question
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to question_path(@question), notice: 'Success!'
    else
      redirect_to question_path(@question), alert: 'Invalid!'
    end
  end
  
  def edit
  end

  def update
    if @answer.update(answer_params)
      redirect_to question_path(@question), notice: 'Success!'
    else
      flash[:alert] = 'Invalid!'
      render :edit
    end
  end
  
  def destroy
    if @answer.destroy
      redirect_to question_path(@question), notice: 'Deleted!'
    else
      flash[:alert] = 'Failed!'
      render :edit
    end
  end
  
  private
    def set_question
      @question = Question.find(params[:question_id])
    end
    
    def set_answer
      set_question
      @answer = @question.answers.find(params[:id])
    end
    
    def answer_params
      params.require(:answer).permit(:question_id, :name, :content)
    end
end
