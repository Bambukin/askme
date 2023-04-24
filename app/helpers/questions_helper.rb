module QuestionsHelper
  def person_who_asked(question)
    if question.author.present?
      link_to "@#{question.author.nickname}", user_path(question.author)
    else
      'anonim'
    end
  end
end
