# frozen_string_literal: true

module TestPassagesHelper
  def question_numbers(test_passage)
    "Question #{test_passage.current_question_number} of #{test_passage.questions_count}"
  end

  def result_message(test_passage)
    content_tag :p do
      p = content_tag(:h2, "Your test is #{test_passage.result_message}!", class: 'test-passage', data: { result: test_passage.result_message })
      p.concat content_tag(:h3, "Score: #{test_passage.result_percent}%")
    end
  end
end
