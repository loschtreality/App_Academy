class UserMailer < ActionMailer::Base
  default from: "everybody@appacademy.io"

  def welcome_email(user)
    @user = user
    @url = "localhost:3000/session/new"
    mail(to: user.user_name, subject: "Welcome to the site!")
  end
end
