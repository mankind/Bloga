require File.join(File.dirname(__FILE__), '..', 'config', 'environment')
require 'net/imap'
require 'net/http'
require 'rubygems'

# amount of time to sleep after each loop below
SLEEP_TIME = 60

#config = YAML.load(File.read(File.join(File.dirname(__FILE__), '..', 'config', 'mail.yml')))
#config = YAML.load(File.read(File.join(File.dirname(__FILE__), '..', 'config', 'imap_settings.yml')))
config = File.expand_path('../../config/initializers/load_imap_settings',  __FILE__)
#ImapSettings = YAML.load(File.read(Rails.root + 'config' + 'imap_settings.yml'))[Rails.env].with_indifferent_access

begin
  puts 'Checking for new mail'
  #imap = Net::IMAP.new(config['host'], config['port'], true)
  imap = Net::IMAP.new(config[:host], config[:port], true)
  #imap.login(config['username'], config['password'])
  imap.login(config[:username], config[:password])

  # select inbox as our mailbox to process
  imap.select('Inbox')
  
  # get all emails that are in inbox that have not been deleted
  imap.uid_search(["NOT", "DELETED"]).each do |uid|
    # fetches the straight up source of the email
    source   = imap.uid_fetch(uid, 'RFC822').first.attr['RFC822']
  
  begin
     
	puts 'begining the receive method'
	 Emailer.receive(source)
	
     end
  
   # Delete the email
    imap.uid_copy(uid, "[Gmail]/All Mail")
    imap.uid_store(uid, "+FLAGS", [:Deleted])
  end

  # expunge removes the deleted emails
  imap.expunge
  imap.logout
  imap.disconnect
  # NoResponseError and ByResponseError happen often when imap'ing
  rescue Net::IMAP::NoResponseError => e
    # Log if you'd like
  rescue Net::IMAP::ByeResponseError => e
    # Log if you'd like
  rescue => e
  puts "Error: #{e.message}"
    #log.warn e
	#logger.error "Error receiving email: #{Time.now.to_s} - #{e.message}"
	
  # sleep for SLEEP_TIME and then do it all over again
  sleep(SLEEP_TIME)
  
end
