class Movie < ActiveRecord::Base

  has_many :reviews

  validates :title, presence: true
  validates :director, presence: true
  validates :runtime_in_minutes, numericality: {only_integer: true}
  validates :description, presence: true
  validates :release_date, presence: true
  validate :release_date_is_in_the_past

  mount_uploader :poster, PosterUploader

  def review_average
    if reviews.size != 0
      reviews.sum(:rating_out_of_ten)/reviews.size
    else
      0
    end
  end

  protected

  def release_date_is_in_the_past
    if release_date.present? 
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end
  end

  def self.search_title_director(search_term)
    where("title LIKE :term OR director LIKE :term", term: "%#{search_term}%")
  end

  def self.search_time(search_term)
    case search_term
    when '1' then where("runtime_in_minutes <= ?", 90)
    when '2' then where("runtime_in_minutes > ? AND runtime_in_minutes <= ?", 90, 120)
    when '3' then where("runtime_in_minutes > ?", 120)
    end
  end

end
