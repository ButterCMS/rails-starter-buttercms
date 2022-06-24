class PagesController < ApplicationController
  def index
    page_type = params[:page_type] || 'landing-page'
    slug = params[:slug] || 'landing-page-with-components'

    @menu_items = get_collection('navigation_menu_item')
    @page_data = get_page(page_type, slug)
    @latest_blog_posts = get_latest_posts

    render layout: page_type.to_s
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

  def preview
    return 1 if params[:preview].to_i == 1

    0
  end
end
