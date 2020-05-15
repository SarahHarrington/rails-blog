module Api
  class UsersController < ApplicationController
    def show
      render json: current_user
    end

    def create
      @user = User.new(user_params)
      if @user.save
        render json: @user
      else
        render status: 400
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end
end