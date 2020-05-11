module ApplicationHelper
  def current_year
    "Current year: #{Date.current.year}"
  end

  def github_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def show_flash_message
    content_tag :p, flash[:alert], class: 'flash alert' if flash[:alert]
  end
end
