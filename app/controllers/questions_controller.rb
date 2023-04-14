class QuestionsController < ApplicationController
  # skip_before_action :verify_authenticity_token
  before_action :set_question, only: %i[update hide show destroy edit]

  def show; end

  def index
    @questions = Question.all
  end

  def hide
    @question.update(hidden: true)

    redirect_to questions_path
  end

  def create
    question = Question.create(
      question_params
      # body: params[:question][:body],
      # user_id: params[:question][:user_id]
    )

    # render text: 'Ваш запрос обработан'
    redirect_to question_path(question)
  end

  def update
    @question.update(question_params)

    redirect_to question_path(@question)
  end

  def destroy
    @question.destroy

    redirect_to questions_path
  end

  def new
    @question = Question.new
  end

  def edit; end

  private

  def question_params
    params.require(:question).permit(:body, :user_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
