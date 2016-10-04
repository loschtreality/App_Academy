class ContactSharesController < ApplicationController
  def new
  end

  def create
    @cs = ContactShare.new(c_share_params)
    if @cs.save!
      render json: @cs
    else
      render json: @cs.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    ContactShare.find(params[:id]).destroy!
    render json: ContactShare.all
  end

  private
  def c_share_params
    params.require(:contact_share).permit(:user_id, :contact_id)
  end
end
