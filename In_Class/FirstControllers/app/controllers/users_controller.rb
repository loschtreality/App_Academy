class UsersController < ApplicationController
  def index
    user = User.all
    render json: user
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    render json: User.find(params[:id])
  end


  def update
    user = User.find(params[:id]).update(user_params)
    render json: user
  end

  def destroy
    User.find(params[:id]).destroy!
    render json: User.all
  end

  private

  def user_params
    params.require(:user).permit(:email, :name)
  end

end
