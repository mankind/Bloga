#!/usr/bin/env ruby

require 'rubygems'
require 'daemons'
#dir = File.dirname(__FILE__)
#Daemons.run(dir + '/mail_receiver.rb')

require File.expand_path(File.join(File.dirname(__FILE__), '..', 'config', 'environment'))

#does not add .rb to the file name
dir = File.expand_path('../../bin/mail_receiver.rb',  __FILE__)

#adds .rb to the file name
#dir = File.expand_path(File.dirname(__FILE__) + '/bin/mail_receiver.rb')
dir = File.expand_path(File.dirname(__FILE__) )
Daemons.run(dir + '/bin/mail_receiver.rb')


#Now you can run commands like ruby bin/mail_receiver_ctl.rb start to start your script 
#and ruby bin/mail_receiver_ctl.rb stop to stop it. Very handy.
#check status with 'ruby bin/mail_receiver_ctl.rb  status'