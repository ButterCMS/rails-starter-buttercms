class ButterCmsError < StandardError

  class ApiKeyNotSet < ButterCmsError
  end

  class PostNotFound < ButterCmsError
  end

  class ResourceNotFound < ButterCmsError
  end

  class MissingComponentPartial < ButterCmsError
  end

end