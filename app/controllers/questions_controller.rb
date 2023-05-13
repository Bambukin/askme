class QuestionsController < ApplicationController
  before_action :ensure_current_user, only: %i[update hide destroy edit]
  before_action :set_question_for_current_user, only: %i[update hide destroy edit]

  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.includes(:user, :author).order(created_at: :desc).first(10)
    @users = User.order(created_at: :desc).first(10)
    @hashtags = Hashtag.with_questions
                       .joins(:questions)
                       .group(:id)
                       .order('COUNT(questions.id) DESC')
                       .first(10)
  end

  def hide
    @question.update(hidden: true)

    redirect_to user_path(@question.user.nickname), notice: 'Вопрос скрыт!'
  end

  def create
    question_params = params.require(:question).permit(:body, :user_id)

    @question = Question.new(question_params)
    @question.author = current_user

    if QuestionSave.(question: @question, params: question_params)
      redirect_to user_path(@question.user.nickname), notice: 'Новый вопрос создан!'
    else
      @user = @question.user
      flash.now[:alert] = 'Ошибка при создании вопроса!'

      render :new
    end
  end

  def update
    question_params = params.require(:question).permit(:body, :answer)

    if QuestionSave.(question: @question, params: question_params)
      redirect_to user_path(@question.user.nickname), notice: 'Вопрос отредактирован!'
    else
      flash.now[:alert] = 'Ошибка при редактировании!'

      render :edit
    end
  end

  def destroy
    @user = @question.user
    @question.destroy

    redirect_to user_path(@user.nickname), notice: 'Вопрос удален!'
  end

  def new
    @question = User.find_by(nickname: params[:nickname]).questions.build
  end

  def edit; end

  private

  def ensure_current_user
    redirect_with_alert unless current_user.present?
  end

  def set_question_for_current_user
    @question = current_user.questions.find(params[:id])
  end
end
