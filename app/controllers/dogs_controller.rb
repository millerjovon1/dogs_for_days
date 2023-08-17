class DogsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @dogs = Dog.all

    @markers = @dogs.geocoded.map do |dog|
      {
        lat: dog.latitude,
        lng: dog.longitude,
        marker_html: render_to_string(partial: "dogs/map_marker", locals: { dog: dog })
      }
    end
  end

  def show
    @dog = Dog.find(params[:id])
    @booking = Booking.new
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user

    if @dog.save
      redirect_to dog_path(@dog)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :photo, :breed, :age, :size, :price)
  end
end
