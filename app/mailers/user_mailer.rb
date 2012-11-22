class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def sign_up_email(user)
  	mail(to: user.email, subject: "Welcome to Postin")
  end

end
