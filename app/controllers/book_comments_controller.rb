class BookCommentsController < ApplicationController
  def create
  	find_book = Book.find(params[:book_id])
  	comment = current_user.book_comment.new(book_comment_params)
  	comment.book_id = find_book.id
    comment.save
    redirect_to book_path(find_book)
  end

  def destroy
    find_book = Book.find(params[:book_id])
  	comment = current_user.book_comment.new(book_comment_params)
  	comment.book_id = find_book.id
    comment.destroy
    redirect_to book_path(find_book)
  end

  private
  def book_comment_params
  	params.require(:book_comment).permit(:comment)
  end

end
