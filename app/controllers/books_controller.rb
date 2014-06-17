class BooksController < ApplicationController
  def index
    @books = Book.all
    @genres = Genre.all
  end
end
