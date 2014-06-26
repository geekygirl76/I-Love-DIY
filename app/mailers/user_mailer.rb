class UserMailer < ActionMailer::Base
  default from: "contact@ilovediy.ninja"

  def activation_email(user)
    @user = user

    mail(to: user.email, subject: "Welcome to My Awesome Site")
  end


end
