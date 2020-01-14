class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_max_answers_for_question, on: %i[create update]

  scope :correct, -> { where(correct: true) }

  def validate_max_answers_for_question
    number_of_records = new_record? ? 4 : 5
    errors.add(:question, 'have already enough answers(1..4)') if question.answers.count >= number_of_records
  end
end
