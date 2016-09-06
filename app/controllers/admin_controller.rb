class AdminController < ApplicationController
  before_action :check_admin

  def index
    @books = Book.all
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  # def set_book
  #   @book = Book.find(params[:id])
  # end

  def check_user
    if !user_signed_in?
    end
  end

  def check_admin

  end
end
