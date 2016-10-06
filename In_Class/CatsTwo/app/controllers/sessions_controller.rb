class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user.nil?
      flash.now[:errors] = "User doesn't exist"
      render :new # flash incorect login
    else
      user.reset_session_token!
      login!(user)
      redirect_to cats_url
    end
  end


end
