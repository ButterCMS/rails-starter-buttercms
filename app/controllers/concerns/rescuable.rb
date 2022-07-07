module Rescuable
  extend ActiveSupport::Concern

  included do
    rescue_from ButterCmsError::ApiKeyNotSet do
      logger.warn "Please add your API token to the .env file as RAILS_BUTTER_CMS_API_KEY. You can use the .env.example located in the root of the project as reference."
      render 'pages/missing_token', layout: false
    end

    rescue_from ButterCmsError::PostNotFound do |e|
      @page_data = OpenStruct.new(seo: OpenStruct.new(title: 'Not found',
                                                      description: ''),
                                  breadcrumbs: helpers.breadcrumbs(title: 'Not Found', crumbs: [
                                                            { title: 'Home', url: root_path },
                                                            { title: 'Blog', url: blog_index_path },
                                                            { title: 'Not found', url: nil }
                                                          ]))
      logger.warn e.to_s
      render 'blog/show'
    end

    rescue_from ButterCmsError::ResourceNotFound, ButterCMS::NotFound do |e|
      logger.warn e.to_s
      render 'pages/404', layout: false
    end

    rescue_from ButterCMS::Unauthorized do |e|
      logger.warn 'Your Butter token is set to an invalid value. Please verify your token is correct.'
      render 'pages/404', layout: false
    end

    rescue_from ButterCmsError::MissingComponentPartial do |e|
      component_name = e.message[/components\/_(.+)\swith/, 1]
      logger.warn "Your page in ButterCMS contains a component \"#{component_name}\", for which a partial view is missing. Please create such view, place it in app/views/components and name it the same as the component in ButterCMS Api"
      render 'pages/404', layout: false
    end

  end
end