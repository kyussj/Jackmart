class UserMailer < ActionMailer::Base
  default from: "notifications@example.com"

  def welcome_email(user)
    @user = user
	@url  = "https://jackmart.herokuapp.com/"
    mail(:to => user.email, :subject => "Welcome to the Jackmart app")
  end
end