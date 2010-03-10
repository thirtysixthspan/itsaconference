ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
        :enable_starttls_auto => true,
        :address => "localhost",
        :port => 25,
        :domain => "reddirtrubyconf.com",
}
