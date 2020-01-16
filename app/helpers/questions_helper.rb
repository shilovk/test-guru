module QuestionsHelper
  def question_header
    title = @question.present? ? 'Create New' : 'Edit'
    title + "#{@test.title} Question"
  end

  def question_form_url
    @question.persisted? ? [@question] : [@test, @question]
  end
end
