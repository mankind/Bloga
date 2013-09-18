
ImapSettings = YAML.load(File.read(Rails.root + 'config' + 'imap_settings.yml'))[Rails.env].with_indifferent_access