module ApplicationHelper
  def current_year
    "Current year: #{Time.current.year}"
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  def flash_class(type)
    case type
    when :notice then 'alert alert-info'
    when :success then 'alert alert-success'
    when :error then 'alert alert-danger'
    when :alert then 'alert alert-warning'
    end
  end

  def show_flash(flash)
    content_tag :p do
      flash.each do |type, message|
        concat(
          content_tag(
            :div,
            (
              message +
              button_tag(type: 'button', class: 'close', 'data-dismiss': 'alert', 'aria-label': 'Close') do
                content_tag(:span, '&times;'.html_safe, 'aria-hidden': 'true')
              end
            ).html_safe,
            class: "alert #{flash_class(type.to_sym)} alert-dismissible fade show",
            role: 'alert'
          )
        )
      end
    end
  end
end
