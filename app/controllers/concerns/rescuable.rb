module Rescuable
  extend ActiveSupport::Concern
  included do
    rescue_from ApiKeyNotSetError do |exception|
      render 'pages/missing_token'
    end
  end
end