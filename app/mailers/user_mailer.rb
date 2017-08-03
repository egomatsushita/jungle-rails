class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
  # default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    # @user = user
    # @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    # mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
