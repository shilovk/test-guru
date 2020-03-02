# frozen_string_literal: true

class Test < ApplicationRecord
  LEVEL_TYPES = %w[easy normal hard hero].freeze
  LEVEL_RANGES = [0..1, 2..4, 5..5, 6..Float::INFINITY].freeze

  default_scope { order(created_at: :asc) }

  has_many :questions, -> { order(:id) }, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', inverse_of: :created_tests, optional: true

  validates :title, :category_id, :timer_seconds, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :title, uniqueness: { scope: :level, case_sensitive: false, message: 'with this level is already exists' }

  scope :find_with_category_title, ->(title) { joins(:category).where(categories: { title: title }).order(title: :desc) }

  LEVEL_TYPES.each do |type|
    scope type, -> { where(level: levels[type]) }
  end

  def self.array_of_titles_by_category_title(title)
    find_with_category_title(title).pluck(:title)
  end

  def self.levels
    @levels = LEVEL_TYPES.each_with_object({}).with_index do |(type, memo), index|
      memo[type] = LEVEL_RANGES[index]
    end
  end

  def self.level_range_of(level_type)
    levels[level_type]
  end

  def level_type
    @level_type = Test.levels.delete_if { |_types, ranges| ranges.exclude? level }.keys[0]
  end

  def timer_value
    Time.at(timer_seconds || 0).utc
  end

  def timer_value=(time_hash)
    self.timer_seconds = Time.parse(time_hash.values.join(':')).seconds_since_midnight
  end

  def timer_string
    (timer_seconds || 0).zero? ? '' : timer_value.strftime('%T')
  end
end
