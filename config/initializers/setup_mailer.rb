ActionMailer::Base.smtp_settings = {
  :address              => "mail.eptikar.com",
  :port                 => 465,
  :domain               => "eptikar.com",
  :user_name            => ENV["EMAIL_USERNAME"],
  :password             => ENV["EMAIL_PASSWORD"],
  :authentication       => :login,
  :ssl                  => true,
  :tls                  => true,
  :enable_starttls_auto => true
}