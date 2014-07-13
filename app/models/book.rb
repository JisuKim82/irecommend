class Book < ActiveRecord::Base
  has_many :book_genres
  has_many :genres, through: :book_genres
  belongs_to :user

  before_save :set_keywords

  validates :title, :author, :description, :genres, :amazon_id, :rating, presence: true

  scope :finished, ->{ where('finished_on IS NOT NULL') }
  scope :recent, ->{ where('finished_on > ?', 10.days.ago) }
  scope :search, ->(keyword){ where('keywords LIKE ?',"%#{keyword.downcase}%") if keyword.present? }
  scope :filter, ->(title){ joins(:genres).where('genres.name = ?', title) if title.present? }

  ### replaced by "scope :recent, ->{...}"
  # def self.recent
  #   self.where('finished_on > ?', 10.days.ago)  
  # end
  
  #scope :search, ->(keyword){ where(title: keyword) if keyword.present? }
  
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

  protected
    def set_keywords
      self.keywords = [title, author, description].map(&:downcase).join(' ')
    end
end
