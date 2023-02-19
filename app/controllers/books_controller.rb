class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def create
    @user = current_user
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
    if @book_new.save
       redirect_to book_path(@book_new.id), notice: 'You have created book successfully.'
    else
       @books = Book.all
       render :index
    end
  end
  
  def index
    @books = Book.all
    @book_new = Book.new
    @user = current_user
  end

  def show
   @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end
  
  def edit
     @book = Book.find(params[:id])
  end
  
  def update
   is_matching_login_user
   @book = Book.find(params[:id])
  if @book.update(book_params)
    redirect_to book_path(@book.id), notice: 'You have updated book successfully.'
  else
    render :edit
  end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.delete
    redirect_to books_path
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def is_matching_login_user
    book = Book.find(params[:id])
    unless book.user_id == current_user.id
      redirect_to books_path
    end
  end
end
