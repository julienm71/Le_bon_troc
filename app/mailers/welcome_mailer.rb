class WelcomeMailer < ApplicationMailer
  def welcome_mail(user)
    @user = user
    mail to: user.email, subject: "Bienvenue chez Lebontroc #{@user} !", from: "no-reply@lebontroc.fr"
  end
end
