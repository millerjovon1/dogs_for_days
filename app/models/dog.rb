class Dog < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  validates :name,  presence: true
  validates :price, presence: true
  validates :breed, presence: true
  validates :size,  presence: true
  validates :age, presence: true
  has_one_attached :photo
  SIZES = ['small', "medium", 'large']
  enum gender: {male: 'male', female: 'female'}

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  def self.paws_pixels(size)
    case size
    when 'small'
      '24px'
    when 'medium'
      '32px'
    when 'large'
      '46px'
    else
      '24px'
    end
  end

  def self.gender_icon(gender)
    case gender
    when 'male'
      '<i class="fa-solid fa-mars" style="color: #3974db;"></i>'.html_safe
    when 'female'
      '<i class="fa-solid fa-venus"></i>'.html_safe
    else
      '<i class="fa-solid fa-venus"></i>'.html_safe
    end
  end
end
