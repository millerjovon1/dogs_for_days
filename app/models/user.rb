class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :dogs
  has_many :bookings
  has_many :bookings_as_owner, through: :dogs, source: :bookings
  has_many :reviews_as_owner, class_name: "Review", foreign_key: :owner_id
  has_many :reviews_as_renter, class_name: "Review", foreign_key: :renter_id


  def avg_rating
    return 0 if reviews_as_renter.empty?

    ratings = reviews_as_renter.pluck(:rating)
    ratings.sum / ratings.count.to_f
  end
end
