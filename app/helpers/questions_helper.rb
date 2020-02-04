# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    title = question.persisted? ? 'Edit' : 'Create New'
    title + "#{question.test.title} Question"
  end
end
