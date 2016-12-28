class BooksController < ApplicationController
  before_action :fetch_book, only: [:show, :destroy, :edit, :update]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = I18n.t('flash_messages.books.creation_success')
      redirect_to book_path(@book)
    else
      flash[:notice] = I18n.t('flash_messages.books.creation_failure')
      render :new
    end
  end

  def show
    @chapters = @book.chapters.includes(:sections).all
    @new_chapter = @book.chapters.new
    @new_sections = {}
    @chapters.each do |chapter|
      @new_sections[chapter.id] = chapter.sections.new
    end
  end

  def destroy
    if params[:title_confirmation].downcase == @book.title.downcase
      @book.destroy
      flash[:notice] = I18n.t('flash_messages.books.deletion_success')
      redirect_to books_path
    else
      flash[:error] = I18n.t('flash_messages.books.deletion_failure')
      redirect_to book_path(@book)
    end
  end

  def edit

  end

  def update
    if @book.update_attributes(book_params)
      if params[:book][:sorted_chapter_ids]
        render nothing: true
      else
        flash[:notice] = I18n.t('flash_messages.books.update_success')
        redirect_to book_path(@book)
      end
    else
      flash[:error] = I18n.t('flash_messages.books.update_failure')
      render :edit
    end
  end

  private
    def book_params
      params.require(:book).permit(:title, :notes, :sorted_chapter_ids)
    end

    def fetch_book
      @book = Book.find(params[:id])
    end
end
