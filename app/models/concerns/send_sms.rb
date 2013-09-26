require 'rubygems'
require 'twilio-ruby'
#require 'yaml'
require 'rails'

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
    #puts @m.inspect
    #@account_sid = ENV["TWILIO_TEST_ACCOUNT_SID"]  
    #puts @account_sid.inspect
    # @auth_token = ENV["TWILIO_TEST_AUTH_TOKEN"]
    
    #test api cred
    #@account_sid = 'ACd2d96f748f5f0354d23d0d47bdd698cf'
    #@auth_token = '69db6b63bee653f97dcce86ec6c1eee4'
    
    #real api cred
    @account_sid = 'ACda1949a2c4434a5bacfe496f24b541c2'
    @auth_token = 'ae9f2c4a221bc367b3cad21a4a850640'
    
    begin
      puts @account_sid.inspect
      @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    
      @account = @client.account
    
      @message = @account.messages.create({from: '+447890360018',
                                         to: '+447722970352', 
                                         body: msg
                                        })
   
     rescue Twilio::REST::RequestError => e
       puts e.message
    end   #closed begin keyword
    # puts out the result object
    puts @message.inspect
   # puts @message.sid 
  end
end

SendSms.new(ARGV[0])