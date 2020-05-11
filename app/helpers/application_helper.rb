module ApplicationHelper
  def current_year
    "Current year: #{Date.current.year}"
  end

  def github_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def show_flash_message(type)
    content_tag :p, flash[type], class: "flash #{type.to_s}" if flash[type]
  end
end
