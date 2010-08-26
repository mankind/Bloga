require 'spec_helper'

describe PostsController do

   describe "GET 'index'" do
    it "should be successful" do
      get :index
      response.should be_success
     end
	end
	
	describe "GET 'show'" do
    it "should be successful" do
      get :show
      response.should redirect_to("show_posts_path")
     end
	end
	
	describe "GET 'new'" do
    it "should be successful" do
      get :new
	  response.should redirect_to("new_posts_path")
     end
	end

	describe "post 'create'" do
    it "should be successful" do
      post :create
      response.should redirect_to("posts_path")
       end
	 end
	 
end
