class SessionsController < ApplicationController
#
#   def new
#
#   end
#
#   def create
#     user = User.find_by_credentials(
#     params[:username],
#     params[:password]
#     )
#     if user
#       login(user)
#       redirect_to links_url
#     else
#       flash[:errors] = "Invalid Credentials"
#     end
#   end
#
#   def destroy
#     user = User.find(params[:id])
#     logout(user)
#     redirect_to new_session_url
#   end
#
end
