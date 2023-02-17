class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(users_params)
    redirect_to user_path(@user.id)
  end
  
  def index
    @users = User.all
  end
  
  private
  
  def users_params
    params.require(:user).permit(:name, :introduction)
  end
  
end
