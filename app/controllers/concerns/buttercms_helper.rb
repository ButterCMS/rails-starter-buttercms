require 'buttercms-ruby'

module ButtercmsHelper
  def check_token
    raise ApiKeyNotSetError if ENV['RAILS_APP_BUTTER_CMS_API_KEY'].blank?

    ButterCMS.api_token = ENV['RAILS_APP_BUTTER_CMS_API_KEY']
  end

  def get_collection(collection_name)
    ButterCMS::Content.list(collection_name.to_s, { "preview": preview }).first.data[1]
  end

  def get_page(page_type, slug)
    ButterCMS::Page.get(page_type.to_s, slug.to_s, { "preview": preview }).data.fields
  end

  def get_latest_posts(limit = 2)
    ButterCMS::Post.all({
                          "page": 1,
                          "page_size": limit,
                          "preview": preview
                        })
  end

  def get_all_posts
    ButterCMS::Post.all({
                          "preview": preview
                        })
  end

  def get_category_list
    ButterCMS::Category.all
  end

  private

  def preview
    return 1 if params[:preview].to_i == 1

    0
  end
end
