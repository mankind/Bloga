class ApplicationController < ActionController::Base
 
  respond_to :html

  protect_from_forgery
  
  helper_method :authenticate_user_from_token!
  
  # This is our new function that comes before Devise's one
  #before_filter :authenticate_user_from_token!
  # This is Devise's authentication
  #before_filter :authenticate_user!
   
  #before_filter :sign_out_if_token_present
  
  #it seems this current_user is not used as it seems use that define by devise.
  def current_user
    warden.user ||  User.find_by_authentication_token(params[:auth_token])
    super
  end
  
  private
  
  #https://gist.github.com/josevalim/fb706b1e933ef01e4fb6
  # For this example, we are simply using token authentication
  # via parameters. However, anyone could use Rails's token
  # authentication features to get the token from a header.
  def authenticate_user_from_token!
    #user_token = params[:user_token].presence
    user_token = params[ :auth_token].presence
    user       = user_token && User.find_by_authentication_token(user_token)
 
    if user
      #Devise considers the token authentication as a sign in token,
      #i.e. after the first access, the user is signed in and does 
      #not need to append the token in next requests.
      
      # But Notice that here, we are passing store false, so the user is not
      # actually stored in the session and a token is needed
      # for every request. If you want the token to work as a
      # sign in token, you can simply remove store: false.
      
      #sign_in user, store: false
       sign_in :user, @user 
    end
  end
  
  
  #http://lucatironi.github.io/tutorial/2013/05/05/ruby_rails_rubymotion_ios_app_authentication_devise_tutorial_part_one/
  #with devise set based on the above link, we can ignore, the code below.
  
   #log out user if not current_user with token authentication does not log out existing user
   #If you are authenticated as user A on a web browser session, and 
   #then click a token authentication link for user B, it keeps you logged in as user A.
   #https://github.com/plataformatec/devise/issues/1644
  
   #def sign_out_if_token_present
     #if params[:auth_token].present? and (params[:auth_token] != current_user.authentication_token)
      #sign_out current_user
     #end
   #end
  
end
