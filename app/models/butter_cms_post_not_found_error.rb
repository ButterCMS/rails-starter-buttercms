class ButterCmsPostNotFoundError < StandardError
  def message
    'WARNING: Post with this slug was not found in ButterCMS API'
  end
end
