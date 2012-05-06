class UserMailer < ActionMailer::Base
  default from: "notifications@example.com"

  def welcome_email(user)
    @user = user
	@url  = "https://smooth-mist-5552.herokuapp.com/"
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end
end