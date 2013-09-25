#require 'rubygems'
require 'twilio-ruby'
#require 'yaml'

#require_relative '../config/mysettings.yml'
#puts "#{config}"

class SendSms

  
  def initialize(msg)
    @msg = msg
    send_sms(@msg)
  end
  
  def send_sms(msg)
   #@m = YAML::load_file(File.join(Rails.root, 'config', 'mysettings.yml'))
    #@f = File.join(Rails.root, 'config', 'mysettings.yml')
     #puts @f.inspect
    #@m = YAML::load_file(@f)
   # puts @m.inspect
    @account_sid = ENV["TWILIO_TEST_ACCOUNT_SID"]  
    puts @account_sid.inspect
    @auth_token = ENV["TWILIO_TEST_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    
    @account = @client.account
    
    @message = @account.messages.create({from: '+447722970352',
                                         to: '+447890360018', 
                                         body: msg
                                        })
    
    # puts out the result object
    puts @message 
  end
end

SendSms.new(ARGV[0])