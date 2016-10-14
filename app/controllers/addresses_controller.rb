class AddressesController < ApplicationController
  before_action :check_signin
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def show
  end

  # GET /bookmarks/new
  def new
    @bookmark = Bookmark.new
  end

  # GET /bookmarks/1/edit
  def edit
  end

  # POST /bookmarks
  # POST /bookmarks.json
  def create
    @address = current_user.addresses.new(user_id: current_user.id)

    respond_to do |format|
      if @bookmark.save
        format.html {
          redirect_to @book,
          notice: t('.successfully_added', book: @book.name)
        }
        format.json { render :show, status: :created, location: @bookmark }
      else
        format.html { render :new }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookmarks/1
  # PATCH/PUT /bookmarks/1.json
  def update
    respond_to do |format|
      if @bookmark.update(bookmark_params)
        format.html { redirect_to @bookmark, notice: 'Bookmark was successfully updated.' }
        format.json { render :show, status: :ok, location: @bookmark }
      else
        format.html { render :edit }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarks/1
  # DELETE /bookmarks/1.json
  def destroy
    @book = @bookmark.book
    @bookmark.destroy
    respond_to do |format|
      format.html {
        redirect_to @book,
        notice: t('.successfully_removed', book: @book.name)
      }
      format.json { head :no_content }
    end
  end

  private

  def check_signin
    if !user_signed_in?
      respond_to do |format|
        format.html{
          redirect_to new_user_session_path, notice: t('signin_message')
        }
      end
    end
  end

  def set_address
    @address = Address.find(params[:id])
  end

end
