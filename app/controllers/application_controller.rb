class ApplicationController < ActionController::Base
  before_action :authenticate
  protect_from_forgery unless: -> { request.format.json? }

  private

  def authenticate
    authenticate_with_http_token do |token, options|
      user = User.find_by(token: token)

      if user && ActiveSupport::SecurityUtils.secure_compare(user.token, token)
        @current_user = user
      else
        @current_user = nil
      end
    end

    if @current_user
      @current_user
    else
      render json: {}, status: 401
    end
  end

  def current_user
    @current_user
  end
end
