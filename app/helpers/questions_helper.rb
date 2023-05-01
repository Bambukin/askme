module QuestionsHelper
  def person_who_asked(question)
    return 'вы' if question.author == current_user
    if question.author.present?
      link_to "@#{question.author.nickname}", user_path(question.author.nickname)
    else
      'anonim'
    end
  end
end
