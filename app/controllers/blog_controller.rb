class BlogController < ApplicationController
  before_action :menu_items, :categories

  def index
    @page_data = OpenStruct.new(seo: OpenStruct.new(title: 'Sample Blog - All Posts',
                                                    description: 'Sample blog powered by ButterCMS, showing all posts.'),
                                breadcrumbs: breadcrumbs(title: 'All Blog Posts', crumbs: [
                                                           { title: 'Home', url: root_path },
                                                           { title: 'All Blog Posts', url: nil }
                                                         ]))
    @posts = butter_posts
  end

  def category
    @posts = butter_posts({ "category_slug": params[:id] })
    @category = @categories.find { |cat| cat.slug == params[:id] }
    @page_data = OpenStruct.new(seo: OpenStruct.new(title: "Sample Blog - category: #{@category.name}",
                                                    description: "Sample blog powered by ButterCMS, showing category: #{@category.name}."),
                                breadcrumbs: breadcrumbs(title: 'Blog Posts By Category', crumbs: [
                                                           { title: 'Home', url: root_path },
                                                           { title: 'Blog', url: blog_index_path },
                                                           { title: "Category: #{@category.name}", url: nil }
                                                         ]))
    render 'blog/index'
  end

  def tag
    @posts = butter_posts({ "tag_slug": params[:id] })
    tags
    @tag = @tags.find { |tag| tag.slug == params[:id] }
    @page_data = OpenStruct.new(seo: OpenStruct.new(title: "Sample Blog - tag: #{@tag.name}",
                                                    description: "Sample blog powered by ButterCMS, showing tag: #{@tag.name}."),
                                breadcrumbs: breadcrumbs(title: 'Blog Posts by Tag', crumbs: [
                                                           { title: 'Home', url: root_path },
                                                           { title: 'Blog', url: blog_index_path },
                                                           { title: "Tag: #{@tag.name}", url: nil }
                                                         ]))
    render 'blog/index'
  end

  private

  def categories
    @categories ||= butter_categories
  end

  def tags
    @tags ||= butter_tags
  end

  def menu_items
    @menu_items ||= butter_collection('navigation_menu_item')
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
