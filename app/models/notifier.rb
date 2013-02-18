class Notifier < ActionMailer::Base
  default_url_options[:host] = "authlogicexample.binarylogic.com"
  default from: "bipin@virtueinfo.com"

  def deliver_password_reset_instructions(user)

    #body :edit_password_reset_url => edit_password_reset_url(user.perishable_token)

    mail(:to => user.email, :subject => "Password Reset Instructions")
  end
end