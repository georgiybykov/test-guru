module ApplicationHelper
  FLASH_MESSAGE_STYLE = { notice: 'success', alert: 'danger' }

  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  # def show_flash_message(type)
  #   content_tag :p, flash[type], class: "flash #{type.to_s}" if flash[type]
  # end
end
