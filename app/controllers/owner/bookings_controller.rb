class Owner::BookingsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index]

  def index
    @future_bookings = current_user.bookings_as_owner
    @past_bookings = current_user.bookings_as_owner
    @bookings = current_user.bookings_as_owner
  end
end
