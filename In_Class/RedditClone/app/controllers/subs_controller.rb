class SubsController < ApplicationController
  def new
    unless current_user
      redirect_to subs_url
    end
  end

  def index
    @subs ||= Sub.all
  end

  def create
    @new_sub = Sub.new(sub_params)
    @new_sub.moderator_id = current_user.id
    if @new_sub.save!
      redirect_to sub_url(@new_sub)
    else
      flash.now[:errors] = @new_sub.errors.full_messages
      render :new
    end
  end

  def show
    @sub = Sub.find(params[:id])
    @posts = @sub.posts
  end

  def edit
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description, :post_ids)
  end

end
