class Api::QuestionsController < ApplicationController

  # after_initialize :ensure_own_question, only: [:delete, :update]

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def destroy
    @question = current_user.questions.find(params[:id])
    @question.delete
    redirect_to "/#/"
  end



  def create
    @question = current_user.questions.create!(question_params)
    @question.save
    render :show
  end

  def update
    @question = current_user.questions.find(params[:id])
    @question.update_attributes(question_params)
    render :show
  end


  private

  def question_params
    params.require(:question).permit(:title, :description)
  end


end
