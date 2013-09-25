
#ImapSettings = YAML.load(File.read(Rails.root + 'config' + 'imap_settings.yml'))[Rails.env]

#ruby 2.0 but fails with No such file or directory 
#ImapSettings = YAML::load_file(File.join(Rails.root, 'config', 'imap_settings.yml')) 
        
#ImapSettings  = File.join(Rails.root, 'config', 'imap_settings.yml')

ImapSettings =  { 
  host:  ENV['IMAP_TEST_HOST'], 
  port:  ENV['IMAP_TEST_PORT'], 
  username: ENV['IMAP_TEST_USERNAME'], 
  password: ENV['IMAP_TEST_PASSWORD'] 
}

