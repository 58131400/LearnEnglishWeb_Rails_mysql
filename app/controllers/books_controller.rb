class BooksController < ApplicationController
  def index
    if params[:data].nil? && !params[:id].nil?
      book_id = params[:id]
    else
      book_id = params[:data]['book_id']
      student_id = params[:data]['student_id']
      session[:user] = Student.find(student_id)
    end

    @book = Book.find(book_id)
    @unitName = Unit.where('book_id = ? ', @book.BookId)
    session[:current_book] = @book
  end

end
