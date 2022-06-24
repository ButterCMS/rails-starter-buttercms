class PagesController < ApplicationController
  def index
    page_type = params[:page_type] || 'landing-page'
    slug = params[:slug] || 'landing-page-with-components'
    @page_data = get_page(page_type, slug)
    @menu_items = get_collection('navigation_menu_item')

    render layout: page_type.to_s
  end

  def get_collection(collection_name)
    ButterCMS::Content.list(collection_name.to_s).first.data[1]
  end

  def get_page(page_type, slug)
    ButterCMS::Page.get(page_type.to_s, slug.to_s).data.fields
  end
end
