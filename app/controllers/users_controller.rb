class UsersController < ApplicationController
  before_action :set_users, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def index
    @users = User.all
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
    if @user.save
      sign_in :user
      respond_with @user
    else
      render "new"
    end
  end
  
  def update
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_cpnfirmation")
    end
    if @user.update(user_params)
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
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
  
  def set_users
    @user = User.find(params[:id])
    respond_with @user
  end
  
end
