class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    render plain: params[:user].inspect
  end
end
