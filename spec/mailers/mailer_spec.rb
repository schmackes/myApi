require "spec_helper"

describe MyMailer do
  it "should send out a regular mail" do
    to="mr.markus.kaiser@gmail.com"
    subject="My Quickies - Test subject"
    body="this is a short body text"

    mail=Hash[:to=>to,:subject=>subject,:body=>body]

    email = MyMailer.send_mail(mail).deliver

    assert !ActionMailer::Base.deliveries.empty?

    # Test the body of the sent email contains what we expect it to
    email.to[0].should eql(to)
    email.subject.should eql(subject)
    email.encoded.should include(body)
    pending "Email body is somehow not working"
  end

  it "should handle cases with insufficient data (e.g. no mail address)" do
    pending
  end
end
