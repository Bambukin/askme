class HashtagsController < ApplicationController
  def show
    @hashtag = Hashtag.with_questions.find_by(body: params[:body])
    if @hashtag
      @questions = @hashtag.questions.includes(:user, :author)
    else
      send_file "#{Rails.root}/public/404.html", type: 'text/html', disposition: 'inline'
    end
  end
end
