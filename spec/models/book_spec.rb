require 'spec_helper'

describe Book do
  it "is valid with genre, title, author, description, amazon_id and rating" do
    
    fiction = Genre.create(name: 'Fiction')
    book = Book.new(
      title: 'My Favorite Book',
      author: 'Jisu Kim',
      description: 'Lorem ipsum keis sieh ksie hskd',
      amazon_id: '1234567890',
      rating: '5',
      genres: [fiction])
    
    expect(book).to be_valid
  end
  
  it "is invalid without a genre" do
    expect(Book.new(genres:[])).to have(1).errors_on(:genres)
  end
  
  it "is invalid without a title" do
    expect(Book.new(title: nil)).to have(1).errors_on(:title)
  end
  
  it "is invalid without an author" do
    expect(Book.new(author: nil)).to have(1).errors_on(:author)
  end
  
  it "is invalid without a description" do
    expect(Book.new(description: nil)).to have(1).errors_on(:description)
  end
  
  it "is invalid without an amazon_id" do
    expect(Book.new(amazon_id: nil)).to have(1).errors_on(:amazon_id)
  end
  
  it "is invalid without a rating" do
    expect(Book.new(rating: nil)).to have(1).errors_on(:rating)
  end
end