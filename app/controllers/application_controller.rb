class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery unless: -> { request.format.json? }
end
