class PostsController < ApplicationController

  def new
    @subs = Sub.all
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    if @post.save!
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_message
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end


  private

  def post_params
    params.require(:post).permit(:title, :author_id, :content, :url, sub_ids:[])
  end

end
