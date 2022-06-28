class BlogController < ApplicationController
  def index
    @menu_items = get_collection('navigation_menu_item')
    @page_data = OpenStruct.new(seo: OpenStruct.new(title: 'Sample Blog - All Posts',
                                                    description: 'Sample blog powered by ButterCMS, showing all posts.'))
    @posts = get_all_posts
    @categories = get_category_list
  end
end
