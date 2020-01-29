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

  def text_with_button(text, type = 'close', icon = '&times')
    (
      text +
      button_tag(type: 'button', class: type, 'data-dismiss': 'alert', 'aria-label': type) do
        content_tag(:span, icon.try(:html_safe), 'aria-hidden': 'true')
      end
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
end
