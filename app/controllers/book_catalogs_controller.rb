class BookCatalogsController < ApplicationController
  before_action :set_book_catalog, only: [:show, :edit, :update, :destroy]
  before_action :set_book, only: [:index, :new]

  # GET /book_catalogs
  # GET /book_catalogs.json
  def index
    @book_catalogs = @book.book_catalogs
  end

  # GET /book_catalogs/1
  # GET /book_catalogs/1.json
  def show
  end

  # GET /book_catalogs/new
  def new
    @book_catalog = BookCatalog.new
  end

  # GET /book_catalogs/1/edit
  def edit
  end

  # POST /book_catalogs
  # POST /book_catalogs.json
  def create
    @book_catalog = BookCatalog.new(book_catalog_params)

    respond_to do |format|
      if @book_catalog.save
        format.html { redirect_to @book_catalog, notice: 'Book catalog was successfully created.' }
        format.json { render :show, status: :created, location: @book_catalog }
      else
        format.html { render :new }
        format.json { render json: @book_catalog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_catalogs/1
  # PATCH/PUT /book_catalogs/1.json
  def update
    respond_to do |format|
      if @book_catalog.update(book_catalog_params)
        format.html { redirect_to @book_catalog, notice: 'Book catalog was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_catalog }
      else
        format.html { render :edit }
        format.json { render json: @book_catalog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_catalogs/1
  # DELETE /book_catalogs/1.json
  def destroy
    @book_catalog.destroy
    respond_to do |format|
      format.html { redirect_to book_catalogs_url, notice: 'Book catalog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_catalog
      @book_catalog = BookCatalog.find(params[:id])
    end

    def set_book
      @book = Book.find(params[:book_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_catalog_params
      params.require(:book_catalog).permit(:book_id, :catalog)
    end
end
