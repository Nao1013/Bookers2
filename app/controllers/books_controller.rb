class BooksController < ApplicationController
  
  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       redirect_to book_path(@book.id)
    else
       render :show
    end
  end
  
  def index
    @books = Book.all
    @book_new = Book.new
  end

  def show
    @user = current_user
    @book = Book.find(params[:id])
    @book_new = Book.new
  end
  
  
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
