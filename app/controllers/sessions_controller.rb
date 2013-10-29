class SessionsController < ApplicationController
    respond_to :json, :html
  
  def create
    @user = User.find_for_database_authentication(email: params[:email])
    if @user && @user.valid_password?(params[:password])
      
      
      #make sure the user has a token generated
      @user.ensure_authentication_token!  
      sign_in @user
      #he 1st respond_with doesn't work
      #respond_with(id: @user.id, email: @user.email, authentication_token: @user.authentication_token ,status: :created)
      #respond_with(@user, status: :created)
      
      #this line doesn't include the associations
      #render :json => { user: {id: @user.id, auth_token: @user.authentication_token, email: @user.email} }
      
      render json: @user
    else
      respond_with(errors: {email: "invalid email or password"}, status: :unprocessable_entity)
    end
   end
  
  def destroy
    
    # expire auth token
   current_user.authentication_token = nil
   current_user.save
    #head :ok
    
    #not really need since we are not storing token in session
    #sign_out current_user 
    
    render json: nil, :status => :ok
    
    ##sign_out :user
  end
  
end
