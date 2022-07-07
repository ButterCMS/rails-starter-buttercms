class PagesController < ApplicationController
  def index
    page_type = params[:page_type] || 'landing-page'
    slug = params[:slug] || 'landing-page-with-components'

    @menu_items = butter_collection(['navigation_menu_item']).navigation_menu_item
    @page_data = butter_page(page_type, slug)
    @latest_blog_posts = butter_posts({ page_size: 2 })

    render layout: page_type.to_s

  rescue ActionView::Template::Error => e
    raise ButterCmsError::MissingComponentPartial, e
  end

  def not_found
    render '404', layout: false
  end
end
