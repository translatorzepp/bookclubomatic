class HomeController < ApplicationController

  def index
    @books = Book.all
    @books_partial = "books/index"
    check_for_reader
  end

  private
  def check_for_reader
    if session[:reader_id]
      @reader = Reader.find(session[:reader_id])
      @reader_partial = "readers/show_condensed"
    else
      @reader_partial = "readers/find_or_create"
    end
  end

end
