module TestPassagesHelper
  def question_numbers(test_passage)
    "Question #{test_passage.current_question_number} of #{test_passage.test.questions.count}"
  end
end
