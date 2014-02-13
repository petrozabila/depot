ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
:address => "smtp.gmail.com",
:port => 465,
:domain => "localhost:3000",
:user_name => "petererste2@gmail.com",
:password => "petererste1988",
:authentication => "plain",
:enable_starttls_auto => true
}