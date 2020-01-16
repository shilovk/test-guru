module QuestionsHelper
  def question_header
    title = @question.persisted? ? 'Edit' : 'Create New'
    title + "#{@question.test.title} Question"
  end

  def question_form_url
    @question.persisted? ? [@question] : [@test, @question]
  end
end
