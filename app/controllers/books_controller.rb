class BooksController < ApplicationController

  def new
    @book = Book.new
  end
  # 投稿データの保存
  def create
    @book = Book.new(post_book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def index
    @books = Book.all
  end


  def show
    @books = Book.find(params[:id])
    @user = User.find(params[:id])
    @post_books = @user.books
  end

  def edit
    @book  = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  # 投稿データのストロングパラメータ
  private
  def post_book_params
    params.require(:book).permit(:title, :opinion)
  end
end
