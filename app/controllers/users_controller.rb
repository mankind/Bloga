class UsersController < ApplicationController
  before_action :set_users, only: [:show, :edit, :update, :destroy]
  
  # This is our new function that comes before Devise's one
  before_filter :authenticate_user_from_token!, except: [:new, :create]
  
  before_filter :authenticate_user!, except: [:new, :create]
  
  
  #skip_before_filter :verify_authenticity_token, :only => :create
  
  respond_to :json, :html

  def index
   @users = User.all
    respond_with @users
  end
  
  def edit
  end
   
  def show
  end
  
  def new
    @user = User.new
    respond_with @user
  end
  
  def create
    @user = User.new(user_params)
    @user.reset_authentication_token!
    if @user.save
      sign_in :user, @user
      #respond_with @user
      
      render json: @user
    else
      render "new"
    end
  end
  
  def update
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end
    if @user.update(user_params)
      @user.reset_authentication_token!
      sign_in :user, @user, bypass: true
     
      respond_with @user
    else
      render "edit"
    end
  end
  
  
  def destroy
    @user.destroy
    respond_with @user
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :authentication_token)
  end
  
  def set_users
    @user = User.find(params[:id])
    respond_with @user
  end
  
end
