atom_feed do |feed|
  feed.title "my blg!"
  
  feed.updated @posts.first.updated_at
  
  @posts.each do |post|
     feed.entry(post) do |entry|
	   entry.title post.title
	   emtry.content post.body, :type => "html"
	 end
	 
	 entry.author do |author|
	   author.name "laps gidi"
	 end
  end
end