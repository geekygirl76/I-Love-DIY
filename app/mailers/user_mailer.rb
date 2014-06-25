class UserMailer < ActionMailer::Base
  default from: "contact@mycooldiy.com"
  
  def activation_email(user)
    @user = user
     
    mail(to: user.email, subject: "Welcome to My Awesome Site")
  end
  
  
end
