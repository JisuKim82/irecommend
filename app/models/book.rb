class Book < ActiveRecord::Base
  has_many :book_genres
  has_many :genres, through: :book_genres

  scope :finished, ->{ where('finished_on IS NOT NULL') }
  scope :recent, ->{ where('finished_on > ?', 10.days.ago) }
  
  ### replaced by "scope :recent, ->{...}"
  # def self.recent
  #   self.where('finished_on > ?', 10.days.ago)  
  # end

  def finished?
    finished_on.present?
  end
  
end
