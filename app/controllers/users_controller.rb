class UsersController < ApplicationController
  before_action :set_users, only: [:show, :edit, :update, :destroy]]
  respond_to :html, :json

def index
    @users = User.to_a
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
