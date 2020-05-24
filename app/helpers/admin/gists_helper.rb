module Admin::GistsHelper
  def gist_url_hash(url)
    url.split('/').last
  end
end
