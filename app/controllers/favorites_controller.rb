class FavoritesController < ApplicationController
  def destroy
  find_book = Book.find(params[:book_id])
  favorite = current_user.favorites.find_by(book_id: find_book.id)
  # binding.pry
  favorite.destroy
  redirect_to book_path(find_book.id)
  end

  def create
    find_book = Book.find(params[:book_id])
    # binding.pry
    favorite = current_user.favorites.new(book_id: find_book.id)
    favorite.save
    redirect_to book_path(find_book.id)
  end

end