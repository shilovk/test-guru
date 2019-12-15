class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  attribute :correct, :boolean, default: false
end
