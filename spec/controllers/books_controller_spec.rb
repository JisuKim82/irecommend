require 'spec_helper'

describe BooksController do
  describe 'GET #index' do
    context 'with params[:keyword]' do
      it 'populates an array of Book objects matching the keyword'
    end
  end
end