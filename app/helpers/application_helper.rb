# frozen_string_literal: true

module ApplicationHelper
  def current_year
    "Current year: #{Time.current.year}"
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  def flash_class(type)
    {
      notice: 'alert-info',
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning'
    }[type.to_sym]
  end

  def auto_format_text(text)
    text ||= simple_format(text)
    text.gsub(URI::DEFAULT_PARSER.make_regexp, '<a href="\0" target= "_blank">\0</a>')
  end

  def icon_button(type = 'close', icon = '&times')
    button_tag(type: 'button', class: type, 'data-dismiss': 'alert', 'aria-label': type) do
      content_tag(:span, icon.try(:html_safe), 'aria-hidden': 'true')
    end
  end

  def text_with_button(text, type = 'close', icon = '&times')
    (
      auto_format_text(text) +
      icon_button(type, icon)
    ).try(:html_safe)
  end

  def show_flash(flash)
    content_tag :p do
      flash.each do |type, message|
        concat(
          content_tag(
            :div, text_with_button(message),
            class: "alert #{flash_class(type)} alert-dismissible fade show", role: 'alert'
          )
        )
      end
    end
  end

  def count_timer(value = 1, timer_class = 'count-timer', timer_id = 'count-timer')
    content_tag(
      :p,
      class: timer_class,
      id: timer_id,
      data:
      { time: (Time.current + value.to_i.minutes).to_f * 1000,
        expired: I18n.t('helpers.count_timer.expired')
      }
    ) do
    end
  end
end
