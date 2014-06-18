class Book < ActiveRecord::Base
  has_many :book_genres
  has_many :genres, through: :book_genres

  scope :finished, ->{ where('finished_on IS NOT NULL') }
  scope :recent, ->{ where('finished_on > ?', 10.days.ago) }
  scope :search, ->(keyword){ where(title: keyword) if keyword.present? }
  
  ### replaced by "scope :recent, ->{...}"
  # def self.recent
  #   self.where('finished_on > ?', 10.days.ago)  
  # end

  ### replaced by "scope :search, ->(keyword){...}"
  # def self.search(keyword)
  #   if keyword.present?
  #     self.where(title: keyword)
  #   else
  #     self.all
  #   end
  # end  
  
  def finished?
    finished_on.present?
  end

end
