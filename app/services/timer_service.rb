# frozen_string_literal: true

# TimerService
class TimerService

  def initialize(test_passage)
    @started_time = test_passage.created_at || Time.current
    @test = test_passage.test
    @timer_seconds = @test.timer_seconds
  end

  def time_left
    @timer_seconds - (Time.current - @started_time).seconds
  end

  def time_over?
    return false if @timer_seconds.zero?

    time_left <= 0
  end
end
