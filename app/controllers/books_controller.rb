class BooksController < ApplicationController

  def new
    @book = Book.new
  end
  # 投稿データの保存
  def create
    @book = Book.new(post_book_params)
    @book.user_id = current_user.id
    @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book.id)
  end

  def index
    @post_books = Book.all
  end


  def show
    @books = Book.find(params[:id])

  end

  def edit
    @book  = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def update
    book = Book.find(params[:id])
    book.update(post_book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(book.id)
  end

  # 投稿データのストロングパラメータ
  private
  def post_book_params
    params.require(:book).permit(:title, :opinion)
  end
end
