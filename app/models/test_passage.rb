class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question, on: %i[create update]

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def questions_count
    test.questions.count
  end

  def current_question_number
    questions_count - next_questions.count
  end

  def result_percent
    @correct_questions = correct_questions * 100 / questions_count
  end

  def result_message
    @result_message = result_percent >= 85 ? 'success' : 'fail'
  end

  private

  def before_validation_set_current_question
    self.current_question = next_question if test.present?
  end

  def correct_answer?(answer_ids)
    return false if answer_ids.nil?

    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_questions
    current_question.present? ? test.questions.where('id > ?', current_question.id) : test.questions
  end

  def next_question
    self.current_question = next_questions.first
  end
end
