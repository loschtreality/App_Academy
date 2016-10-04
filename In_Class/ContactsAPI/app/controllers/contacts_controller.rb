class ContactsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    render json: {owned_contacts: @user.contacts, shared_contacts: @user.shared_contacts}
  end
end
