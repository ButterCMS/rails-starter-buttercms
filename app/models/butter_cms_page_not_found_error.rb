class ButterCmsPageNotFoundError < StandardError
  def message
    'WARNING: Page with this url was not found in ButterCMS API'
  end
end
