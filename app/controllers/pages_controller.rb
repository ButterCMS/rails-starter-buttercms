class PagesController < ApplicationController
  def index
    page_type = params[:page_type] || 'landing-page'
    slug = params[:slug] || 'landing-page-with-components'

    @menu_items = butter_collection('navigation_menu_item')
    @page_data = butter_page(page_type, slug)
    @latest_blog_posts = butter_posts({ page_limit: 2 })

    render layout: page_type.to_s
  end
end
