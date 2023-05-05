class ApplicationController < ActionController::Base
  HASHTAG_REGEX = /#[[:word:]-]+/.freeze

  helper_method :current_user

  private
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def redirect_with_alert
    redirect_to root_path, alert: 'Вам сюда нельзя!'
  end

  def hashtags_scan(text)
    hashtags = text.scan(HASHTAG_REGEX).map(&:downcase).uniq
    existing_hashtags = Hashtag.where(body: hashtags).pluck(:body)
    new_hashtags = hashtags - existing_hashtags

    new_hashtags.map do | hashtag |
      Hashtag.create(body: hashtag)
    end

    Hashtag.where(body: hashtags)
  end
end
