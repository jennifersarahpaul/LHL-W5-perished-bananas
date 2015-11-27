class UserMailer < ActionMailer::Base
  default from: "notifications@rottenmangoes.com"
  layout 'mailer'

  def welcome_email(user)
    @user = user
    @url = 'rottenmangoes.com/login'
    mail(to: @user.email, subject: 'Welcome to Rotten Mangoes!')
  end

  def delete_email(user)
    @user = user
    @url = 'rottenmangoes.com/movies/:id'
    mail(to: @user.email, subject: 'User account has been deactived')
  end

end
