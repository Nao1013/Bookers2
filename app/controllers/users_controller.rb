class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book_new = Book.new
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
   @user = current_user
    @users = User.all
    @book_new = Book.new
  end
  
  private
  
  def users_params
    params.require(:user).permit(:name, :introduction)
  end
  
end
