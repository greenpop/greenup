class UserMailer < ActionMailer::Base
  include SendGrid
  default from: "from@example.com"

  def welcome_email(user)
  	@user = user
  	@url = 'http://www.google.com'
  	mail(to: @user.email, subject: "Thank you for using Greenup!")
  end

  def tree_email(user, tree, event)
  	@user = user
  	@tree = tree
  	@event = event
  	mail(to: @user.email, subject: "Thank you for using the GreenUp Travel App!")
  end

  def pledge_email(user, pledge, event)
  	@user = user
  	@pledge = pledge
  	@event = event
  	mail(to: @user.email, subject: "Thank you for using the GreenUp Travel App!")
  end
end
