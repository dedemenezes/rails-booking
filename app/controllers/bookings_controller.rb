class BookingsController < ApplicationController

  def create
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.flat = @flat
    if @booking.save
      redirect_to flat_path(@flat)
    else
      render 'flats/show'
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update!(status: params[:booking][:status].to_i)
    p @booking
    redirect_to profile_path(current_user)
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.accepted!
    redirect_to profile_path(current_user)
  end

  def deny
    @booking = Booking.find(params[:id])
    @booking.denied!
    redirect_to profile_path(current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
