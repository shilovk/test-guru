module ApplicationHelper
  def current_year
    "Current year: #{Time.current.year}"
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  def show_flash(flash)
    content_tag :p do
      flash.each do |type, message|
        concat(content_tag(:p, message, class: "flash #{type}"))
      end
    end
  end
end
