module QuestionsHelper
  def question_header
    title = @question.present? ? 'Create New' : 'Edit'
    title + "#{@test.title} Question"
  end
end
