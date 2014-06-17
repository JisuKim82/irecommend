Book.destroy_all
Genre.destroy_all

fiction = Genre.create!(name: 'Fiction')
non_fiction = Genre.create!(name: 'Non-Fiction')
casino = Genre.create!(name: 'Casino')
programming = Genre.create!(name: 'Programming')

Book.create!([{
  title: 'Bringing Down the House',
  author: 'Ben Mezrich',
  description: 'The amazing inside story about a gambling ring of M.I.T. students who beat the system in Vegas—and lived to tell how.',
  amazon_id: '0743249992',
  rating: 5,
  finished_on: 30.days.ago,
  genres: [non_fiction, casino]
},
{
  title: 'Agile Web Development with Rails 4',
  author: 'Dave Thomas, Sam Ruby & David Heinemeir Hansson',
  description: 'A step-by-step walkthrough of building a real application, and in-depth chapters look at the built-in Rails features.',
  amazon_id: '1937785564',
  rating: 4,
  finished_on: 7.days.ago,
  genres: [programming]    
},
{
  title: 'Eloquent Ruby',
  author: 'Russ Olsen',
  description: 'In Eloquent Ruby, Russ Olsen helps you write Ruby like true Rubyists do–so you can leverage its immense, surprising power.',
  amazon_id: 'B004MMEJ36',
  rating: 4,
  finished_on: nil,
  genres: [programming]
}])

p "Seed created #{Book.count} books..."