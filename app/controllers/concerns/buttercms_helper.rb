require 'buttercms-ruby'

module ButtercmsHelper
  extend ActiveSupport::Concern
  included do
    before_action :check_token

    rescue_from ApiKeyNotSetError do |_exception|
      @page_data = OpenStruct.new(seo: OpenStruct.new(title: 'Please Set Your Butter Token',
                                                      description: ''))
      render 'pages/missing_token'
    end

    rescue_from ButterCmsPostNotFoundError do |e|
      @page_data = OpenStruct.new(seo: OpenStruct.new(title: 'Not found',
                                                      description: ''),
                                  breadcrumbs: breadcrumbs(title: 'Not Found', crumbs: [
                                                             { title: 'Home', url: root_path },
                                                             { title: 'Blog', url: blog_index_path },
                                                             { title: 'Not found', url: nil }
                                                           ]))
      logger.info e.message.to_s
      render 'blog/show'
    end

    rescue_from ButterCmsPageNotFoundError do |e|
      @page_data = OpenStruct.new(seo: OpenStruct.new(title: 'Not found',
                                                      description: ''))
      logger.info e.message.to_s
      render 'pages/404', layout: 'application'
    end

    rescue_from ButterCMS::NotFound do
      @page_data = OpenStruct.new(seo: OpenStruct.new(title: 'Not found',
                                                      description: ''))
      logger.info 'ERROR: a crucial resource that is part of the template was not found in Butter CMS API. Maybe a missing collection.'
      render 'pages/500', layout: 'application'
    end
  end

  def butter_collection(collection_name, options = {})
    ButterCMS::Content.list(collection_name.to_s, merge_preview(options)).first.data[1]
  end

  def butter_page(page_type, slug, options = {})
    ButterCMS::Page.get(page_type.to_s, slug.to_s, merge_preview(options)).data.fields
  rescue ButterCMS::NotFound
    raise ButterCmsPageNotFoundError
  end

  def butter_posts(options = {})
    ButterCMS::Post.all(merge_preview(options))
  end

  def butter_post(slug, options = {})
    ButterCMS::Post.find(slug, merge_preview(options))
  rescue ButterCMS::NotFound
    raise ButterCmsPostNotFoundError
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

  def check_token
    raise ApiKeyNotSetError if ENV['RAILS_BUTTER_CMS_API_KEY'].blank?

    ButterCMS.api_token = ENV['RAILS_BUTTER_CMS_API_KEY']
  end

  def query_string
    params[:q]
  end

  def merge_preview(options)
    if ENV['RAILS_BUTTER_CMS_PREVIEW'].blank? || ENV['RAILS_BUTTER_CMS_PREVIEW'] == true
      options = options.merge({ "preview": 1 })
    end
    options
  end

  def breadcrumbs(title:, crumbs:)
    crumbs_arr = []
    crumbs.each do |crumb|
      crumbs_arr << OpenStruct.new(title: crumb[:title], url: crumb[:url])
    end
    OpenStruct.new(title:,
                   crumbs: crumbs_arr)
  end
end
