class QuestionsController < ApplicationController
  before_action :set_question, only: %i[update hide show destroy edit]

  def show; end

  def index
    @questions = Question.all
    @question = Question.new
  end

  def hide
    @question.update(hidden: true)

    redirect_to user_path(@question.user), notice: 'Вопрос скрыт!'
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to user_path(@question.user), notice: 'Новый вопрос создан!'
    else
      flash.now[:alert] = 'Ошибка при создании вопроса!'

      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to user_path(@question.user), notice: 'Вопрос отредактирован!'
    else
      flash.now[:alert] = 'Ошибка при редактировании!'

      render :edit
    end
  end

  def destroy
    @user = @question.user
    @question.destroy

    redirect_to user_path(@user), notice: 'Вопрос удален!'
  end

  def new
    @user = User.find(params[:user_id])
    @question = Question.new(user: @user)
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
