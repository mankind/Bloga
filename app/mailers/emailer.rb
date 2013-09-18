class Emailer < ActionMailer::Base

 def receive(mail)
   # ensure an author with that mail-address already exists.
  # sender = mail.from
   post = Post.find_by(email: mail.from)
   #raise "Couldn't find author with address #{sender}" if author.nil?
   # create a new post (from the received mail).
   
   post.create!(
     :title => mail.subject,
     :body => mail.body
     )
  
   puts 'posted Email as message'
 end

end