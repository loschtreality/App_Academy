class SessionsController < ApplicationController

  def new
    render :new
  end

  def show
    @user
    redirect_to user_path
  end

  def create
    user = User.find_by_credentials(
    params[:user][:email],
    params[:user][:password]
    )
    
    if user.nil?
      flash.now[:errors] = "Credentials were wrong"
      render :new
    else
      login!(user)
      redirect_to user_url(user)
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

end
