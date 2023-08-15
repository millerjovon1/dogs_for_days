class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
  end

  def new
@dog = Dog.find(params[:dog_id])
@booking = Booking.new
 end

 def create
  @dog = Dog.find(params[:dog_id])
  @booking = Booking.new(booking_params)
  @booking.dog = @dog
  if @booking.save
    redirect_to dog_path(@dog)
  else
    render :new, status: :unprocessable_entity
  end
 end

end
