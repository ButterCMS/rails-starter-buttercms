module ButterCmsExtension
  def self.prepended(base)
    base.singleton_class.send(:prepend, ClassMethods)
  end

  module ClassMethods
    def api_request(path, options = {})
      query = options.dup
      query[:auth_token] ||= api_token

      query[:test] = 1 if test_mode

      # If the user has passed in a "/" leading path, don't interpret that
      # as wanting to get rid of the API prefix
      path = path[1..-1] if path.start_with?('/')

      path = Pathname.new(@api_url.path).join(path).to_s + "?#{URI.encode_www_form(query)}"

      response =
        Net::HTTP.start(@api_url.host, @api_url.port, http_options) do |http|
          request = Net::HTTP::Get.new(path)
          request['User-Agent'] = "ButterCMS/Ruby #{ButterCMS::VERSION}"
          request['Accept']     = 'application/json'

          http.request(request)
        end

      case response
      when Net::HTTPNotFound
        raise ::ButterCMS::NotFound, JSON.parse(response.body)['detail']
      when Net::HTTPUnauthorized
        raise ::ButterCMS::Error, JSON.parse(response.body)['detail']
      end

      response.body
    end
  end
end

module ButterCMS
  prepend ButterCmsExtension
end
