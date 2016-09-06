class CartsController < ApplicationController
  before_action :check_signin
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    @cart_books = @cart.cart_books
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    book_id = params[:book_id]
    @cart = Cart.update_cart({book_id: book_id, user_id: current_user.id})
    respond_to do |format|
      format.html {redirect_to @cart, notice: 'Your book has been successfully added to the cart.'}
      # if @cart.save
      #   format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
      #   format.json { render :show, status: :created, location: @cart }
      # else
      #   format.html { render :new }
      #   format.json { render json: @cart.errors, status: :unprocessable_entity }
      # end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def check_signin
      if !user_signed_in?
        respond_to do |format|
          message = 'If you want to be a part of our family,
          kindly register with us and enjoy the fun of joint family. :) OR
          if you are already part of this fun you can directly log in :D'
          format.html{
            redirect_to new_user_session_path, notice: message
          }
        end
      end
    end

    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:user_id, :book_id, :value)
    end
end
