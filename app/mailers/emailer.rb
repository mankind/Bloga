class Emailer < ActionMailer::Base

 def receive(mail)
   # ensure an author with that mail-address already exists.
  # sender = mail.from
   author = Author.find_by_email(mail.from)
   #raise "Couldn't find author with address #{sender}" if author.nil?
   # create a new post for this author (from received mail).
    #Post.create!(
   author.posts.create!(
     :title => mail.subject,
     :body => mail.body
     )
  # :author => author
   puts 'posted Email as message'
 end

end