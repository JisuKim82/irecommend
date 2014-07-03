require 'spec_helper'

describe BooksController do
  describe 'GET #index' do
    
    before :each do
      @book1 = create(:book, title: 'Bringing Down the House')
      @book2 = create(:book, title: 'Eloquent Ruby')
    end

    context 'with params[:keyword]' do
      it 'populates an array of Book objects matching the keyword' do
        get :index, keyword: 'Ruby'
        expect(assigns(:books)).to match_array([@book2]) 
      end

      it 'renders the :index template' do
        get :index, keyword: 'Ruby'
        expect(response).to render_template :index
      end
    end

    context 'without a params[:keyword]' do
      it 'populates an array of all Book objects' do
        get :index, keyword: nil
        expect(assigns(:books)).to match_array([@book1, @book2])
      end
      it 'renders the :index template' do
        get :index, keyword: nil
        expect(response).to render_template :index
      end
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested book to @book' do
      book = create(:book)
      get :edit, id: book
      expect(assigns(:book)).to eq book
    end

    it 'renders the :edit template' do
      book = create(:book)
      get :edit, id: book
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    # before :each do
    #   @books = [
    #     attributes_for(:book),
    #     attributes_for(:book),
    #     attributes_for(:book)
    #   ]
    # end

    context 'with valid attributes' do
      # it 'saves the new book in the database' do
      #   expect{
      #     post :create,
      #     book: attributes_for(:book, books_attributes: @books)
      #   }.to change(Book, :count).by(1)
      # end
      
      #it 'redirects to books#index' do
        # post :create, book: attributes_for(:book, books_attributes: @books)
        # expect(response).to redirect_to :index
      #end
    end

    context 'with invalid attributes' do
      it 'does not save the book to the database'
    end
  end

  describe 'PATCH #update' do
    before :each do
      @book = create(:book, title: 'Learning Rspec')
    end

    context 'with valid attributes' do
      it 'updates the book in the database' do
        patch :update, id: @book, book: attributes_for(:book)
        expect(assigns(:book)).to eq(@book)
      end

      it 'changes @book\'s attributes' do
        patch :update, id: @book, book: attributes_for(:book, title:'Re-Learning Rspec')
        @book.reload
        expect(@book.title).to eq 'Re-Learning Rspec'
      end

      it 'redirects to books#index' do
        patch :update, id: @book, book: attributes_for(:book)
        expect(response).to redirect_to books_path
      end
    end

    context 'with invalid attributes' do
      it 'does not update the book' do
        patch :update, id: @book, book: attributes_for(:book, author: 'Monkey', title: nil)
        @book.reload
        expect(@book.author).to_not eq 'Monkey'
      end

      it 're-renders the :edit template' do
        patch :update, id: @book, book: attributes_for(:invalid_book)
        expect(response).to render_template :edit
      end 
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @book = create(:book)
    end

    it 'deletes the book from the database' do
      expect{
        delete :destroy, id: @book
      }.to change(Book, :count).by -1
    end

    it 'redirects to books#index' do
      delete :destroy, id: @book
      expect(response).to redirect_to books_path
    end
  end

end