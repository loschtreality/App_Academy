class CommentsController < ApplicationController
  def index
    if params[:user_id]
      @uc = User.find(params[:user_id])
      render json: {comments_about: @uc.comments_about, authored_comments: @uc.authored_comments}
    else
      render json: Contact.find(params[:contact_id]).comments_about
    end
  end
end
