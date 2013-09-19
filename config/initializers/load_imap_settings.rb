
ImapSettings = YAML.load(File.read(Rails.root + 'config' + 'imap_settings.yml'))[Rails.env]

#ImapSettings  = File.join(Rails.root, 'config', 'imap_settings.yml')


=begin
ImapSettings =  { 
  host:  ENV['IMAP_HOST'], 
  port:  ENV['IMAP_PORT'], 
  username: ENV['IMAP_USERNAME'], 
  password: ENV['IMAP_PASSWORD'] 
}
=end