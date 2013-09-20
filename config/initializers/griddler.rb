#the gem also adds a route which you can see with rake routes
#https://github.com/thoughtbot/griddler/blob/master/config/routes.rb
#email_processor POST   /email_processor(.:format)     griddler/emails#create  

Griddler.configure do |config|
  config.processor_class = EmailProcessor
  config.to = :email # :full, :email, :hash 
  config.reply_delimiter = '-- REPLY ABOVE THIS LINE --'
  config.email_service = :mandrill
end
