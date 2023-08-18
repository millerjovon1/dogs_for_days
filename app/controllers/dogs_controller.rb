class DogsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @dogs = Dog.all
    #@dogs = @dogs.where('price >= ?', params[:min_price]) if params[:min_price].present?
    #@dogs = @dogs.where('price <= ?', params[:max_price]) if params[:max_price].present?
    @dogs = @dogs.where(size: params[:size]) if params[:size].present?
    #@dogs = @dogs.near(params[:location]) if params[:location].present?

    @dogs = dogs.where(gender: params[:gender]) if params[:gender].present?


    @markers = @dogs.geocoded.map do |dog|
      {
        lat: dog.latitude,
        lng: dog.longitude,
        marker_html: render_to_string(partial: "dogs/map_marker", locals: { dog: dog }),
        popup_html: render_to_string(partial: "dogs/map_popup", locals: { dog: dog })
      }
    end

    @dogs = dogs.where(gender: params[:gender]) if params[:gender].present?

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
