class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :dog
  validates :start_date, presence: true
  validates :end_date, presence: true
  enum status: [ :pending, :accepted, :rejected ]
  scope :past, -> { where('end_date < ?', Date.today) }
  scope :future, -> { where('start_date >= ?', Date.today) }
  def past?
    end_date < Date.today
  end
end
