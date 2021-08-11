class QuestionsController < ApplicationController
  before_action :set_question, only: [:edit, :show, :update, :destroy]

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
  end

  def show
  end
  
  def update
    if @question.update(question_params)
      redirect_to root_path, notice: 'Success!'
    else
      flash[:alert] = 'Failed!'
      render :edit
    end
  end

  def destroy
    if @question.destroy
      redirect_to root_path, notice: 'Success!'
    else
      flash[:alert] = 'Failed!'
    end
  end
  
  private
    def set_question
      @question = Question.find(params[:id])
    end
    
    def question_params
      params.require(:question).permit(:name, :title, :content)
    end
end
