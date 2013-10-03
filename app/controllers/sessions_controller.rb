class SessionsController < ApplicationController
    respond_to :json, :html
  
  def create
    @user = User.find_for_database_authentication(email: params[:session][:email])
    if @user && @user.valid_password?(params[:session][:password])
      sign_in @user
      respond_with(id: @user.id, email: @user.email, status: :created)
    else
      respond_with(errors: {email: "invalid email or password"}, status: :unprocessable_entity)
    end
   end
  
  def destroy
    sign_out :user
    respond_with @user
  end
  
end
