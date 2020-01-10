class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', inverse_of: :created_tests, optional: true
  has_many :questions, dependent: :destroy
  has_many :test_users, dependent: :destroy
  has_many :users, through: :test_users

  scope :easy, -> { where(level: 0..1) }
  scope :normal, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :titles_by_category_title, ->(title) { joins(:category).where(categories: { title: title }).order(title: :desc).pluck(:title) }

  validates :title, presence: true
  validates :level, numericality: { only_integer: true }
  validate :validate_unique_title_level, on: :create
  validate :validate_unique_title_level, on: :update

  def validate_unique_title_level
    record = Test.find_by(title: title, level: level)
    return unless record

    errors.add("The test with id=#{record.id} is already present with the fields:")
    errors.add(:title, title)
    errors.add(:level, level)
  end
end
