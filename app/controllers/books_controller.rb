class BooksController < ApplicationController
  before_action :fetch_book, only: [:show, :destroy]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def show
    flash.now[:notice] = "This is a success flash message"
    flash.now[:error] = "This is a danger flash message"
    #flash.now[:warning] = "This is a warning flash message"
    flash.now[:info] = "This is a info flash message"
  end

  def destroy
    if params[:title_confirmation].downcase == @book.title.downcase
      @book.destroy
      redirect_to books_path, success: "Book titled '#{@book.title}' is successfully deleted"
    else
      redirect_to book_path(@book), danger: "Book not deleted, as you did not enter the correct book title."
    end
  end

  private
    def book_params
      params.require(:book).permit(:title, :notes)
    end

    def fetch_book
      @book = Book.find(params[:id])
    end
end
