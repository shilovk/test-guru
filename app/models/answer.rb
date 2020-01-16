class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_max_answers_for_question, on: :create

  scope :correct, -> { where(correct: true) }

  def validate_max_answers_for_question
    errors.add(:question, 'have already enough answers(1..4)') if question.answers.count >= 4
  end
end
