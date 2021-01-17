# frozen_string_literal: true

module Admin::GistsHelper
  def fetch_gist_hash_from_url(url)
    url.split('/').last
  end
end
