class UserMailer < ActionMailer::Base
  include SendGrid
  default from: "info@greenpop.org"

  def tree_email(user, tree, event)
  	@user = user
  	@event = event
  	mail(to: @user.email, subject: "Thank you for using the GreenUp Travel App!")
  end

  def pledge_email(user, pledge, event)
  	@user = user
  	@event = event
  	mail(to: @user.email, subject: "Thank you for using the GreenUp Travel App!")
  end
end
