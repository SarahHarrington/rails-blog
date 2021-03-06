class UsersController < ApplicationController
  # before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  # before_action :correct_user, only: [:edit, :update]
  # before_action :admin_user, only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    # @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      redirect_to root_url
    else
      render 'new'
    end
  end

  def update
    # @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def edit
    @user = User.find(params[:id])
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  #confirms the user is logged in
  def logged_in_user
    store_location
    unless logged_in?
      redirect_to login_url
    end
  end

  def correct_user
    #since @user is defined here, it was removed from the edit and update methods
    @user = User.find(params[:id])
    # redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end