require 'spec_helper'

describe Book do
  it "is valid with genre, title, author, description, amazon_id and rating"
  it "is invalid without a genre"
  it "is invalid without a title"
  it "is invalid without an author"
  it "is invalid without a description"
  it "is invalid without an amazon_id"
  it "is invalid without a rating"
end