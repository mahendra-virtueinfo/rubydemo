class Mailer < ActionMailer::Base
  default from: "bipin@virtueinfo.com"
  default_url_options[:host] = request.host

  def welcome_email(user)
    @user = user
    @url  = request.url + "/login"
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end

  def password_reset_instructions(user)
    @user = user

    mail(:to => user.email, :subject => "Reset password")
  end
end


#<div class="field">
# <%= form.fields_for :group,user_group_form  do |group_fields| %>

#<%= group_fields.label :name %><br />
#<%= group_fields.select :name, Group.all.collect {|p| [ p.name, p.id ] }, { :include_blank => true } %><br /><br />
#</div>
#<% end %>