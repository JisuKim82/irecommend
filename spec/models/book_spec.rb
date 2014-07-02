require 'spec_helper'

describe "Connecting Books to Genres through 2 Factories" do
  before :each do 
    @genre = create(:genre) #genre must be created first
    @book = build(:book)  #build instead of create due to validation check
    @book.genres << @genre
  end

  it "should associate the book with the genre" do
    expect(@book.title).to eq 'How to use FactoryGirl'
    expect(@genre.name).to eq 'Programming'
    expect(@book.genres.length).to eq 1
  end
end

describe Book do
  before :each do 
    @fiction = Genre.create(name: 'Fiction')
    @book = Book.new(
      title: 'My Favorite Book',
      author: 'Jisu Kim',
      description: 'Lorem ipsum keis sieh ksie hskd',
      amazon_id: '1234567890',
      rating: '5',
      genres: [@fiction])
  end

  it "is valid with genre, title, author, description, amazon_id and rating" do    
    expect(@book).to be_valid
  end
  
  it "is invalid without a genre" do
    expect(Book.new(genres:[])).to have(1).errors_on(:genres)
  end
  
  it "is invalid without a title" do
    book = build(:book, title: nil)
    expect(book).to have(1).errors_on(:title)
  end
  
  it "is invalid without an author" do
    book = build(:book, author: nil)
    expect(book).to have(1).errors_on(:author)
  end
  
  it "is invalid without a description" do
    book = build(:book, description: nil)
    expect(book).to have(1).errors_on(:description)
  end
  
  it "is invalid without an amazon_id" do
    book = build(:book, amazon_id: nil)
    expect(book).to have(1).errors_on(:amazon_id)
  end
  
  it "is invalid without a rating" do
    book = build(:book, rating: nil)
    expect(book).to have(1).errors_on(:rating)
  end

  describe "#set_keywords" do
    
    it "sets keywords based on joined title/author/description that have been downcased" do
      
      fiction = Genre.create(name: 'Fiction')
      book = Book.create(
        title: 'How To',
        author: 'Curious George',
        description: 'Lorem ipsum',
        amazon_id: '1234567890',
        rating: '4',
        genres: [fiction])
      
      expect(book.keywords).to eq "how to curious george lorem ipsum"
    end
  end


end