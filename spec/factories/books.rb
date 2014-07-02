FactoryGirl.define do 
  factory :book do
    title "How to use FactoryGirl"
    author "Jisu Kim"
    description "Lorme Ipsum Kf Factory"
    amazon_id "0987654321"
    rating 3
  end

  factory :genre do
    name 'Programming'
  end

  factory :book_genre do
    book
    genre
  end
  
end