require 'buttercms-ruby'

module InitButterCMS
  def check_token
    raise ApiKeyNotSetError if ENV["RAILS_APP_BUTTER_CMS_API_KEY"].blank?

    ButterCMS::api_token = ENV["RAILS_APP_BUTTER_CMS_API_KEY"];
  end
end