class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end
  
  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_path, notice: 'Success!'
    else
      flash[:alert] = 'Failed!'
      render :new
    end
  end
  
  def new
    @question = Question.new
  end
  
  def edit
    @question = Question.find(params[:id])
  end
  
  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to root_path, notice: 'Success!'
    else
      flash[:alert] = 'Failed!'
      render :edit
    end
  end
  
  private
    def question_params
      params.require(:question).permit(:name, :title, :content)
    end
end
