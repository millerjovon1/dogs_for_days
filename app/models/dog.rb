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
end
