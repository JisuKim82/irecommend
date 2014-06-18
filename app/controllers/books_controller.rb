class BooksController < ApplicationController
  def index
    # @books = Book.all
    @genres = Genre.all
    @books = Book.search(params[:keyword])
  end
end
