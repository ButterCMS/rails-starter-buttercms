module ButtercmsHelper
  extend ActiveSupport::Concern
  include Rescuable
  
  included do
    before_action :set_token
  end

  def butter_collection(collection_names_array, options = {})
    ButterCMS::Content.fetch(collection_names_array, merge_preview(options))
  rescue ButterCMS::NotFound
    raise ButterCmsError::ResourceNotFound, "Collection: \"#{collection_name}\" was not found in Butter CMS API"
  end

  def butter_page(page_type, slug, options = {})
    ButterCMS::Page.get(page_type.to_s, slug.to_s, merge_preview(options)).data.fields
  rescue ButterCMS::NotFound
    raise ButterCmsError::ResourceNotFound,
          "Page with page type: \"#{page_type}\" and slug: \"#{slug}\" was not found in Butter CMS API"
  end

  def butter_posts(options = {})
    ButterCMS::Post.all(merge_preview(options))
  end

  def butter_post(slug, options = {})
    ButterCMS::Post.find(slug, merge_preview(options))
  rescue ButterCMS::NotFound
    raise ButterCmsError::PostNotFound, "Blog post with slug: \"#{slug}\" was not found in Butter CMS API"
  end

  def butter_categories(options = {})
    ButterCMS::Category.all(merge_preview(options))
  end

  def butter_tags(options = {})
    ButterCMS::Tag.all(merge_preview(options))
  end

  def butter_search(options = {})
    ButterCMS::Post.search(query_string, merge_preview(options))
  end

  private

  def set_token
    raise ButterCmsError::ApiKeyNotSet if ENV['RAILS_BUTTER_CMS_API_KEY'].blank?

    ButterCMS.api_token = ENV['RAILS_BUTTER_CMS_API_KEY']
  end

  def query_string
    params[:q]
  end

  def merge_preview(options)
    if ENV['RAILS_BUTTER_CMS_PREVIEW'].blank? || ENV['RAILS_BUTTER_CMS_PREVIEW'] == "true"
      options = options.merge({ "preview": 1 })
    end
    options
  end

end
