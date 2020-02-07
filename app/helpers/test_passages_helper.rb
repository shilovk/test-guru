# frozen_string_literal: true

module TestPassagesHelper
  def question_numbers(test_passage)
    "Question #{test_passage.current_question_number} of #{test_passage.questions_count}"
  end

  def result_message(test_passage)
    content_tag :p do
      p = content_tag(:h2, "Your test is #{test_passage.result_message}!", class: 'test-passage', data: { result: test_passage.result_message })
      p.concat content_tag(:h3, "Score: #{test_passage.result_percent}%")
    end
  end

  def progress_bar(progress = 0, type = :primary, animate = false)
    content_tag(:div, class: 'progress') do
      content_tag(
        :div,
        class: "progress-bar #{line_with(animate)} bg-#{type}",
        'aria-valuemax' => '100',
        'aria-valuemin' => '0',
        'aria-valuenow' => '0',
        data: { progress: progress },
        role: 'progressbar',
        style: 'width: 0%'
      ) do
        progress.to_s + '%'
      end
    end
  end

  def line_with(animate)
    animate ? 'progress-bar-striped progress-bar-animated' : ''
  end
end
