class BlogController < ApplicationController
  before_action :menu_items, :categories

  def index
    @page_data = OpenStruct.new(seo: OpenStruct.new(title: 'Sample Blog - All Posts',
                                                    description: 'Sample blog powered by ButterCMS, showing all posts.'),
                                breadcrumbs: helpers.breadcrumbs(title: 'All Blog Posts', crumbs: [
                                                           { title: 'Home', url: root_path },
                                                           { title: 'All Blog Posts', url: nil }
                                                         ]))
    @posts = butter_posts
  end

  def category
    @category = @categories.find { |cat| cat.slug == params[:id] }
    raise ButterCmsError::ResourceNotFound, "Category \"#{params[:id]}\" was not found in Butter CMS API" if @category.blank?

    @posts = butter_posts({ "category_slug": params[:id] })
    @page_data = OpenStruct.new(seo: OpenStruct.new(title: "Sample Blog - category: #{@category.name}",
                                                    description: "Sample blog powered by ButterCMS, showing category: #{@category.name}."),
                                breadcrumbs: helpers.breadcrumbs(title: 'Blog Posts By Category', crumbs: [
                                                           { title: 'Home', url: root_path },
                                                           { title: 'Blog', url: blog_index_path },
                                                           { title: "Category: #{@category.name}", url: nil }
                                                         ]))
    render 'blog/index'
  end

  def tag
    @tags = butter_tags
    @tag = @tags.find { |tag| tag.slug == params[:id] }
    raise ButterCmsError::ResourceNotFound, "Tag \"#{params[:id]}\" was not found in Butter CMS API" if @tag.blank?

    @posts = butter_posts({ "tag_slug": params[:id] })
    @page_data = OpenStruct.new(seo: OpenStruct.new(title: "Sample Blog - tag: #{@tag.name}",
                                                    description: "Sample blog powered by ButterCMS, showing tag: #{@tag.name}."),
                                breadcrumbs: helpers.breadcrumbs(title: 'Blog Posts by Tag', crumbs: [
                                                           { title: 'Home', url: root_path },
                                                           { title: 'Blog', url: blog_index_path },
                                                           { title: "Tag: #{@tag.name}", url: nil }
                                                         ]))
    render 'blog/index'
  end

  def search
    @posts = butter_search
    @page_data = OpenStruct.new(seo: OpenStruct.new(title: "Sample Blog - search results for #{params[:q]}",
                                                    description: "Sample blog powered by ButterCMS, showing search results for query: \"#{params[:q]}\""),
                                breadcrumbs: helpers.breadcrumbs(title: 'Search Results', crumbs: [
                                                           { title: 'Home', url: root_path },
                                                           { title: 'Blog', url: blog_index_path },
                                                           { title: "Search: #{params[:q]}", url: nil }
                                                         ]))
    render 'blog/index'
  end

  def show
    @post = butter_post(params[:id])
    @page_data = OpenStruct.new(seo: OpenStruct.new(title: @post.seo_title,
                                                    description: @post.meta_description,
                                                    featured_image: @post.featured_image),
                                breadcrumbs: helpers.breadcrumbs(title: @post.title, crumbs: [
                                                           { title: 'Home', url: root_path },
                                                           { title: 'Blog', url: blog_index_path },
                                                           { title: @post.title, url: nil }
                                                         ]))
  end

  private

  def categories
    @categories ||= butter_categories
  end

  def menu_items
    @menu_items ||= butter_collection(['navigation_menu_item']).navigation_menu_item
  end
end
