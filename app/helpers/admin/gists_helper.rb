# frozen_string_literal: true

module Admin::GistsHelper
  def hash_of_url(url)
    url.split('/').last
  end
end
