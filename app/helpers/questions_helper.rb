module QuestionsHelper
  def person_who_asked(question)
    return 'вы' if question.author == current_user
    if question.author.present?
      link_to "@#{question.author.nickname}", user_path(question.author.nickname)
    else
      'anonim'
    end
  end

  def text_with_hashtags(text)
    strip_tags(text).gsub(Hashtag::HASHTAG_REGEX) do |ht|
      link_to ht, hashtag_path(ht.delete('#').downcase), class: "italic"
    end
  end
end
