class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validate :validate_max_answers

  def validate_max_answers
    errors.add(:answers, 'value can be from 1 to 4') if answers.count > 4
  end
end
