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
end
