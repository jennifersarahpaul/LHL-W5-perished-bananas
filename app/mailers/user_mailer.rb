class UserMailer < ActionMailer::Base
  default from: "notifications@perishedbananas.com"
  layout 'mailer'

  def welcome_email(user)
    @user = user
    @url = 'perishedbananas.com/login'
    mail(to: @user.email, subject: 'Welcome to Perished Bananas!')
  end

  def delete_email(user)
    @user = user
    @url = 'perishedbananas.com/movies/:id'
    mail(to: @user.email, subject: 'User account has been deactived')
  end

end
