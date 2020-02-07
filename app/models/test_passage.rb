# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def questions_count
    @questions_count = test.questions.count
  end

  def current_question_number
    @current_question_number = test.questions.where('id <= ?', current_question.id).count
  end

  def result_percent
    @result_percent = correct_questions * 100 / questions_count
  end

  def result_message
    @result_message = result_percent >= 85 ? 'success' : 'fail'
  end

  def progress
    current_question_number * 100 / questions_count
  end

  private

  def before_validation_set_current_question
    self.current_question = next_question if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
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
