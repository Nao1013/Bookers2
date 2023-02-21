class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
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
    if @user.update(users_params)
    redirect_to user_path(@user.id), notice: 'You updated yuor info successfully.'
    else
      render :edit
    end
  end
  
  def index
   @user = current_user
    @users = User.all
    @book_new = Book.new
  end
  
  private
  
  def users_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to user_path(current_user)
    end
  end
  
end
