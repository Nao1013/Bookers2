class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:i])
    @books = @user.books
  end
  
end
