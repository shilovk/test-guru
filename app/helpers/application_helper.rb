module ApplicationHelper
  def current_year
    "Current year: #{Date.today.year}"
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end
end
