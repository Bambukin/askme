class QuestionsController < ApplicationController
  before_action :set_question, only: %i[update hide show destroy edit]

  def show; end

  def index
    @questions = Question.all
    @question = Question.new
  end

  def hide
    @question.update(hidden: true)

    redirect_to questions_path, notice: 'Вопрос скрыт!'
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to question_path(@question), notice: 'Новый вопрос создан!'
    else
      flash.now[:alert] = 'Ошибка при создании вопроса!'

      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to question_path(@question), notice: 'Вопрос отредактирован!'
    else
      flash.now[:alert] = 'Ошибка при редактировании!'

      render :edit
    end
  end

  def destroy
    @question.destroy

    redirect_to questions_path, notice: 'Вопрос удален!'
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
