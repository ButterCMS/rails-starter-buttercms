class ApplicationController < ActionController::Base
  include InitButterCMS
  include Rescuable

  before_action :check_token
end
