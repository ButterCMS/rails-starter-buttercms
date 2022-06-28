class ApplicationController < ActionController::Base
  include ButtercmsHelper
  include Rescuable

  before_action :check_token
end
