class Review < ApplicationRecord
  belongs_to :renter, class_name: "User"
  belongs_to :owner, class_name: "User"
  RATINGS = [1, 2, 3, 4, 5]
  validates :rating, numericality: { only_integer: true, in: 1..5 }
end
