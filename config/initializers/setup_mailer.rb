ActionMailer::Base.smtp_settings = {
  :address              => "mail.eptikar.com",
  :port                 => 465,
  :domain               => "eptikar.com",
  :user_name            => ENV["MAILER_ACCOUNT"],
  :password             => ENV["MAILER_ACCOUNT_PASSWORD"],
  :authentication       => :login,
  :ssl                  => true,
  :tls                  => true,
  :enable_starttls_auto => true
}