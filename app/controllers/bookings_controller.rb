class BookingsController < ApplicationController
  def index
    @future_bookings = current_user.bookings.future
    @past_bookings = current_user.bookings.past
  end

  def new
    @dog = Dog.find(params[:dog_id])
    @booking = Booking.new
  end

  def create
    @dog = Dog.find(params[:dog_id])
    @booking = Booking.new(booking_params)
    @booking.dog = @dog
    @booking.user = current_user
      if @booking.save
        redirect_to bookings_path
      else
        render "dogs/show", status: :unprocessable_entity
      end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to owner_bookings_path
  end

     private

    def booking_params
      params.require(:booking).permit(:start_date, :end_date, :status)
    end
end
