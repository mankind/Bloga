require 'rubygems'
require 'daemons'
dir = File.dirname(__FILE__)
Daemons.run(dir + '/mail_receiver.rb')

#Now you can run commands like ruby bin/mail_receiver_ctl.rb start to start your script 
#and ruby bin/mail_receiver_ctl.rb stop to stop it. Very handy.