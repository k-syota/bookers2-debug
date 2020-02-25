class BookCommentsController < ApplicationController
  def create
  	@find_book = Book.find(params[:book_id])
  	@comment = current_user.book_comments.new(book_comment_params)
  	@comment.book_id = @find_book.id
  	 	# binding.pry
    @comment.save
    redirect_to book_path(@find_book)
  end

  def destroy
  	@book = Book.find(params[:book_id])
    @comment = @book.book_comments.find(params[:id])
      	# binding.pry
    if @comment.user_id == current_user.id
  	  @comment.destroy
      redirect_to book_path(@book.id)
    else
      redirect_to books_path
    end
  end

  private
  def book_comment_params
  	params.require(:book_comment).permit(:comment, :book_is, :user_id)
  end

end
