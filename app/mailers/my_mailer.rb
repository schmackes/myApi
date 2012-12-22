class MyMailer < ActionMailer::Base
  default :from => "myquickies@gmail.com"

  #sends email to recipient with subject and body
  def send_mail(email)
    puts email.to_s
    @body=email[:body]
    mail(:to =>email[:to], :subject => email[:subject])
  end
end
