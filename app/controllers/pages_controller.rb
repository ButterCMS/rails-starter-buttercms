class PagesController < ApplicationController
  def index
    page_type = params[:page_type] || 'landing-page'
    slug = params[:slug] || 'landing-page-with-components'

    @menu_items = get_collection('navigation_menu_item')
    @page_data = get_page(page_type, slug)
    @latest_blog_posts = get_latest_posts

    render layout: page_type.to_s
  end
end
