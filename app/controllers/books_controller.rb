class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       redirect_to book_path(@book.id), notice: 'You have created book successfully.'
    else
       render :show
    end
  end
  
  def index
    @books = Book.all
    @book_new = Book.new
    @user = current_user
  end

  def show
    @user = current_user
    @book = Book.find(params[:id])
    @book_new = Book.new
  end
  
  def edit
     @book = Book.find(params[:id])
  end
  
  def update
   is_matching_login_user
   @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id), notice: 'You have updated book successfully.'
  end
  
  def destroy
    book = Book.find(params{:id})
    book.delete
    redirect_to books_path
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to users_path
    end
  end
end
