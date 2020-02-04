# frozen_string_literal: true

class Test < ApplicationRecord
  has_many :questions, -> { order(:id) }, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', inverse_of: :created_tests, optional: true

  validates :title, :category_id, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :title, uniqueness: { scope: :level, case_sensitive: false, message: 'with this level is already exists' }

  scope :easy, -> { where(level: 0..1) }
  scope :normal, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :find_with_category_title, ->(title) { joins(:category).where(categories: { title: title }).order(title: :desc) }

  def self.array_of_titles_by_category_title(title)
    find_with_category_title(title).pluck(:title)
  end
end
