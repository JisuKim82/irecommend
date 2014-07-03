FactoryGirl.define do 
  factory :book do
    title "How to use FactoryGirl"
    author "Jisu Kim"
    description "Lorme Ipsum Kf Factory"
    amazon_id "0987654321"
    rating 3

    #takes care of the validation requirement of book requiring a genre
    after(:build) do |book|
      book.genres << create(:genre)
    end

    factory :invalid_book do
      title nil
    end
  end

  factory :genre do
    name 'Programming'
  end

  factory :book_genre do
    book
    genre
  end
  
end