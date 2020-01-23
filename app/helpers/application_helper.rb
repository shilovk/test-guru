module ApplicationHelper
  def current_year
    "Current year: #{Time.current.year}"
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  def show_flash(flash)
    content_tag :p do
      flash.each do |message, type|
        concat(content_tag :p, type, class: "flash #{message}")
      end
    end
  end
end
