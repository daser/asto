class UserNotifier < ActionMailer::Base
    require_from_ce('models/user_notifier')


  def signup_notification(user)
    setup_email(user)        
    @subject    += "#{:please_activate_your_new_account.l(:site => configatron.community_name)}"
    mail(:to => @recipients, :subject => @subject)
  end

  def payment_mail(user)
  	setup_email(user)
  	@subject += "Proceed with the registration : Astoria"
  	mail(:to => @recipients, :subject=>@subject)
  end


def confirm_notification(user)
    setup_email(user)        
    @subject    += "#{:please_activate_your_new_account.l(:site => configatron.community_name)}"
    @url  = "#{home_url}users/#{user.activation_code}/activate"
    mail(:to => @recipients, :subject => @subject)
end

end
