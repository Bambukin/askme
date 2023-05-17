class HashtagsController < ApplicationController
  def show
    @hashtag = Hashtag.with_questions.find_by(body: params[:body])
    if @hashtag
      @questions = @hashtag.questions.includes(:user, :author)
    else
      not_found
    end
  end
end
