ActionMailer::Base.smtp_settings = {
  address: ENV["ACTIONMAILER_BASE_SMTP_SETTINGS_ADDRESS"],  
  port: ENV["ACTIONMAILER_BASE_SMTP_SETTINGS_PORT"],
  domain: ENV["ACTIONMAILER_BASE_SMTP_SETTINGS_DOMAIN"],
  user_name: ENV["ACTIONMAILER_BASE_SMTP_SETTINGS_USERNAME"],  
  password:  ENV["ACTIONMAILER_BASE_SMTP_SETTINGS_PASSWORD"],  
  authentication: ENV["ACTIONMAILER_BASE_SMTP_AUTHENTICATION"],  
  enable_starttls_auto: true
 } 
   
   
   
   
  