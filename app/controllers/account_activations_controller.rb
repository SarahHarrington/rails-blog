class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])

    if user && !user.activated?)
      user.activate
      #add some sort of flash
      log_in user
      redirect_to user
    else
      #add some sort of flash
      redirect_to root_url
    end
  end
end
