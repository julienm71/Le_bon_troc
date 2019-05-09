class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :annonces, dependent: :destroy
  # after_create :welcome_mail

  def welcome_mail
    WelcomeMailer.welcome_mail(self).deliver
  end
end
