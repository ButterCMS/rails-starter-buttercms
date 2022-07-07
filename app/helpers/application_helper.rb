module ApplicationHelper

  def breadcrumbs(title:, crumbs:)
    crumbs_arr = []
    crumbs.each do |crumb|
      crumbs_arr << OpenStruct.new(title: crumb[:title], url: crumb[:url])
    end
    OpenStruct.new(title:,
                   crumbs: crumbs_arr)
  end

end
