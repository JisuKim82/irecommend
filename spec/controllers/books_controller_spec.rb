require 'spec_helper'

describe BooksController do
  describe 'GET #index' do
    context 'with params[:keyword]' do
      it 'populates an array of Book objects matching the keyword'
      it 'renders the :index template'
    end

    context 'without a params[:keyword]' do
      it 'populates an array of all Book objects'
      it 'renders the :index template'
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested book to @book'
    it 'renders the :edit template'
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new book in the database'
      it 'redirects to books#index'
    end

    context 'with invalid attributes' do
      it 'does not save the book to the database'
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      it 'updates the book in the database'
      it 'redirects to books#index'
    end

    context 'with invalid attributes' do
      it 'does not update the book'
      it 're-renders the :edit template'
    end
  end


end