class User < ActiveRecord::Base

  after_destroy :send_email

  has_many :reviews, dependent: :destroy
  has_secure_password

  paginates_per 10

  def full_name
    "#{firstname} #{lastname}"
  end

  def send_email
    UserMailer.delete_email(self).deliver
  end
  
end
