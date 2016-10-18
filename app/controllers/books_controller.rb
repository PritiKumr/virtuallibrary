class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy, :check_pincode]

  def home
    @books = Book.all
    @categories = Category.all
    @featured_books = Book.featured
    @latest_books = Book.latest
    @popular_books = Book.limit(4)
  end

  # GET /books
  # GET /books.json
  def index
    # TODO: If category is not present add a small error page specifically.
    if params[:category].present?
      category = Category.find(params[:category])
      @books = category.books.order(price: :asc)
    elsif params[:author].present?
      author = Author.find(params[:author])
      @books = author.books.order(price: :asc)
    elsif params[:tag].present?
      tag = Tag.find(params[:tag])
      @books = tag.books.order(price: :asc)
    else
      @books = Book.order(price: :asc)
    end
    @tags = Tag.all
    @categories = Category.all
    @authors = Author.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def check_pincode
    result = User.delieverable?(params[:pincode])
    respond_to do |format|
      if !@result
        distance = User.distance(params[:pincode])
        format.html {
          redirect_to @book, notice: t('.delieverable', distance: distance)
        }
        format.json { head :no_content }
      else
        format.html { redirect_to @book, notice: t('.no_delivery') }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(
        :sku, :name, :price, :author_id, :publication_id
      )
    end
end
