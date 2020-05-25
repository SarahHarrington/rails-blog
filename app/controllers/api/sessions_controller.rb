module Api
  class SessionsController < ApplicationController
    skip_before_action :authenticate, only: [:create]

    def create
      user = User.find_by(email: user_params[:email].downcase)

      if user && user.authenticate(user_params[:password])
        user.regenerate_token unless user.token
        render json: { token: user.token }, status: 201
      else
        render json: { errors: ['Unauthorized'] }, status: 401
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :password)
    end
  end
end