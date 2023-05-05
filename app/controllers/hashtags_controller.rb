class HashtagsController < ApplicationController

  def show
    @hashtag = Hashtag.find_by(body: params[:body])
  end

  private

  def hashtag_params
    params.fetch(:hashtag, {}).permit(:body)
  end
end
