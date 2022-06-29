require 'buttercms-ruby'

module ButtercmsHelper
  def check_token
    raise ApiKeyNotSetError if ENV['RAILS_APP_BUTTER_CMS_API_KEY'].blank?

    ButterCMS.api_token = ENV['RAILS_APP_BUTTER_CMS_API_KEY']
  end

  def butter_collection(collection_name, options = {})
    options = options.merge({ "preview": 1 }) if preview?
    ButterCMS::Content.list(collection_name.to_s, options).first.data[1]
  end

  def butter_page(page_type, slug, options = {})
    options = options.merge({ "preview": 1 }) if preview?
    ButterCMS::Page.get(page_type.to_s, slug.to_s, options).data.fields
  end

  def butter_posts(options = {})
    options = options.merge({ "preview": 1 }) if preview?

    ButterCMS::Post.all(options)
  end

  def butter_categories(options = {})
    ButterCMS::Category.all(options)
  end

  def butter_tags(options = {})
    ButterCMS::Tag.all(options)
  end

  def butter_search(options = {})
    ButterCMS::Post.search(query_string, options)
  end

  private

  def query_string
    params[:q]
  end

  def preview?
    return true if params[:preview].to_i == 1

    false
  end
end
